

resource "aws_security_group" "main_sg" {
  name        = "${var.prefix}_sg"
  description = "Allow Apple Desktop Traffic"
  vpc_id      = var.vpc_id

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
}