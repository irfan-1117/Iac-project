locals {
  vpc_cidr_bit_values = split(".", var.cidr_block)
}