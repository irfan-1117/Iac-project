output "aws_vpc" {
  value = aws_vpc.vpc.id
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.azs.names
}

output "public_subnet_ids" {
  value = [
    for subnet in aws_subnet.public : subnet.id
  ]
}

output "private_subnet_ids" {
  value = [
    for subnet in aws_subnet.private : subnet.id
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "eip_ip" {
  value = aws_eip.nat_eip.address
}