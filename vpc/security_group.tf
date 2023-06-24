
resource "aws_security_group" "devops" {
  vpc_id      = data.aws_vpc.devops.id
  name        = "devops"
  description = "security group for devops"
  tags = {
    Name = "devops"
  }
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "all open outbound access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    ipv6_cidr_blocks = []
  }]
  dynamic "ingress" {
    for_each = var.ingress
    content {
      cidr_blocks = lookup(ingress.value, "cidr_blocks", null)
      description = lookup(ingress.value, "description", null)
      to_port     = lookup(ingress.value, "to_port", 0)
      from_port   = lookup(ingress.value, "from_port", 0)
      protocol    = lookup(ingress.value, "protocol", -1)
      self        = lookup(ingress.value, "self", null)
    }
  }
}


#resource "aws_security_group_rule" "vpc_range" {
# from_port         = 0
#to_port           = 0
#protocol          = "-1"
#description       = "all open for vpc"
#cidr_blocks       = [data.aws_vpc.devops.cidr_block]
#type              = "ingress"
#security_group_id = aws_security_group.devops.id
#}