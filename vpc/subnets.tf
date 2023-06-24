resource "aws_subnet" "public" {
  count             = length(data.aws_availability_zones.azs.names)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  tags = {
    Name = "${var.name}-public-${count.index}"
    Type = "public"
  }
  cidr_block              = "${local.vpc_cidr_bit_values[0]}.${local.vpc_cidr_bit_values[1]}.${count.index}.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count             = length(data.aws_availability_zones.azs.names)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  tags = {
    Name = "${var.name}-private-${count.index}"
    Type = "private"
  }
  cidr_block              = "${local.vpc_cidr_bit_values[0]}.${local.vpc_cidr_bit_values[1]}.${10 + count.index}.0/24"
  map_public_ip_on_launch = false
}