
resource "aws_launch_template" "main_template" {

  name          = "${var.prefix}_template"
  tags          = local.tags
  instance_type = var.instance_type
  image_id      = data.aws_ami.main_ami.id
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.main_sg.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ssm_inst_profile.name
  }

  user_data = var.user_data

  dynamic "license_specification" {
    for_each = aws_licensemanager_license_configuration.license
    content {
      license_configuration_arn = one(aws_licensemanager_license_configuration.license[*].arn)
    }
  }

  dynamic "placement" {
    for_each = aws_licensemanager_license_configuration.license
    content {
      tenancy                 = "host"
      host_resource_group_arn = one(aws_resourcegroups_group.host_group[*].arn)
    }
  }
}
