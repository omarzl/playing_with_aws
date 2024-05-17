module "linux-infra" {
  source = "./modules/aws-linux"

  instance_type       = "t2.micro"
  ami_filter          = "al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"
  vpc_id              = var.vpc_id
  number_of_instances = var.number_of_instances
}