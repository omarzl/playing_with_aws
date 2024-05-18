
module "ssm_inst_profile" {
  source = "../../../terraform/modules/aws-ec2-ssm-iam"
  prefix = "linux"
}