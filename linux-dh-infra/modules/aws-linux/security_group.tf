

resource "aws_security_group" "apple_remote_desktop" {
  name        = "sg_apple_remote_desktop"
  description = "Allow Apple Desktop Traffic"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "SSH over 22"
      from_port        = 0
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = var.management_subnet
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "VNC for ARD"
      from_port        = 0
      to_port          = 5900
      protocol         = "tcp"
      cidr_blocks      = var.management_subnet
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "remote desktop connection"
  }
}