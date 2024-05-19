
# In this example we are not using user_data to install Java
# instead we are using a custom AMI generated with Packer

module "linux_dh_infra" {
  source = "../modules/ec2-autoscaling-infra"

  instance_type           = "a1.medium"
  ami_filter              = "al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"
  prefix                  = "linux_dh"
  vpc_id                  = var.vpc_id
  max_number_of_instances = var.max_number_of_instances
  key_name                = var.key_name
  dedicated_hosts = {
    should_use  = true
    host_family = "a1"
  }
}