
module "macos_dh_infra" {
  source = "../modules/ec2-autoscaling-infra"

  instance_type               = "mac2.metal"
  ami_filter                  = "amzn-ec2-macos-14.4*"
  prefix                      = "mac_dh"
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  availability_zones          = ["us-east-1b"] # mac2.metal instances aren't available in us-east-1a
  associate_public_ip_address = true
  max_number_of_instances     = var.max_number_of_instances
  key_name                    = var.key_name
  dedicated_hosts = {
    should_use  = true
    host_family = "mac2"
  }
}