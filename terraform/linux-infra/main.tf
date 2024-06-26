module "linux_infra" {
  source = "../modules/ec2-autoscaling-infra"

  instance_type           = "t2.micro"
  ami_filter              = "al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"
  prefix                  = "linux"
  vpc_id                  = var.vpc_id
  max_number_of_instances = var.max_number_of_instances
  key_name                = var.key_name
  user_data               = filebase64("${path.module}/user-data.sh")
}