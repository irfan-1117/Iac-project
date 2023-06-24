resource "aws_eip" "nat_eip" {
  tags = {
    Name = var.name
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = var.name
  }
}