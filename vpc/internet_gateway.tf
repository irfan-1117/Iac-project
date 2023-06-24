resource "aws_internet_gateway" "internet_gateway" {
  tags = {
    Name = var.name
  }
  vpc_id = aws_vpc.vpc.id
}