module "macos-xcode-15-infra" {
  source = "./modules/aws-macos"

  instance_type       = "mac2.metal"
  ami_filter          = "amzn-ec2-macos-14.4*"
  vpc_id              = var.vpc_id
  number_of_instances = var.number_of_instances
}