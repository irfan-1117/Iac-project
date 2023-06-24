variable "cidr_block" {
  description = "cidr for the vpc for eg 10.10.0.0/16 or 10.10.0.0/24"
  type        = string
}

variable "ingress" {
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Tomcat port"
    },
    {
      from_port   = 4000
      to_port     = 4000
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      description = "custom port"
    },
    {
      self        = true
      description = "all open for same sg"
    }

  ]
  description = "inbound ports for my vpc"
}

variable "name" {
  default = "devops"
}

