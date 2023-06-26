output "aws_ami" {
  value = data.aws_ami.ubuntu_22.id
}

output "ubuntu22_public_ip" {
  value = [
    for instance in aws_instance.ubuntu22 : instance.public_ip
  ]
}

