data "aws_ami" "ubuntu22" {
  owners = ["559769862091"]
  filter {
    name   = "tag:Name"
    values = ["ubuntu22"]
  }
}
resource "aws_instance" "ubuntu22" {
  for_each      = toset(var.instance_type)
  ami           = data.aws_ami.ubuntu22.id
  instance_type = each.value
  key_name      = aws_key_pair.aws_key_pair.key_name
  tags = {
    Name = "irfan-${each.value}"
  }
}
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}
resource "aws_key_pair" "aws_key_pair" {
  key_name   = "Devops-key"
  public_key = tls_private_key.private_key.public_key_openssh
}
resource "aws_ebs_volume" "volume" {
  for_each          = toset(["t2.micro", "t2.nano"])
  size              = 1
  availability_zone = aws_instance.ubuntu22[each.value].availability_zone
  tags = {
    Name = "irfan-${each.value}"
  }
}
resource "aws_volume_attachment" "volume" {
  for_each     = toset(var.instance_type)
  volume_id    = aws_ebs_volume.volume[each.value].id
  instance_id  = aws_instance.ubuntu22[each.value].id
  device_name  = "/dev/sdf"
  skip_destroy = false
  force_detach = true
}
