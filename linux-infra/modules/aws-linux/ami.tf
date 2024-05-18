
data "aws_ami" "linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = [var.ami_filter]
  }
}
