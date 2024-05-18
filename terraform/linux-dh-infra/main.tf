
module "linux-dh-infra" {
  source = "../modules/ec2-autoscaling-infra"

  instance_type           = "a1.medium"
  ami_filter              = "al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"
  prefix                  = "linux_dh"
  vpc_id                  = var.vpc_id
  max_number_of_instances = var.max_number_of_instances
  key_name                = var.key_name
}