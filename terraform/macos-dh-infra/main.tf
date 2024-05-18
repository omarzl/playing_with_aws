
module "macos_dh_infra" {
  source = "../modules/ec2-autoscaling-infra"

  instance_type           = "mac2.metal"
  ami_filter              = "amzn-ec2-macos-14.4*"
  prefix                  = "mac_dh"
  vpc_id                  = var.vpc_id
  max_number_of_instances = var.max_number_of_instances
  key_name                = var.key_name
}