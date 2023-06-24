resource "aws_route" "internet_gateway_route" {
  route_table_id         = aws_vpc.vpc.default_route_table_id
  gateway_id             = aws_internet_gateway.internet_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.name
  }
}

resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.private_route_table.id
  gateway_id             = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private" {
  count          = length(data.aws_availability_zones.azs.names)
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private[count.index].id
}