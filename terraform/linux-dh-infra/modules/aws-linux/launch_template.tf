
resource "aws_launch_template" "ios_template" {

  name          = "${local.prefix}_template"
  tags          = local.tags
  instance_type = var.instance_type
  image_id      = data.aws_ami.macos_ami.id

  license_specification {
    license_configuration_arn = aws_licensemanager_license_configuration.license.arn
  }

  placement {
    tenancy                 = "host"
    host_resource_group_arn = aws_resourcegroups_group.ios_host_group.arn
  }

  vpc_security_group_ids = [aws_security_group.apple_remote_desktop.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ssm_inst_profile.name
  }
}
