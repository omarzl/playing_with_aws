
resource "aws_launch_template" "ios_template" {

  name          = "${local.prefix}_template"
  tags          = local.tags
  instance_type = var.instance_type
  image_id      = data.aws_ami.macos_ami.id

  vpc_security_group_ids = [aws_security_group.apple_remote_desktop.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ssm_inst_profile.name
  }
}
