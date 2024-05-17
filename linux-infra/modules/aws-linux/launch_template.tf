
resource "aws_launch_template" "linux_template" {

  name          = "${local.prefix}_template"
  tags          = local.tags
  instance_type = var.instance_type
  image_id      = data.aws_ami.macos_ami.id
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.sg_linux.id]

  iam_instance_profile {
    name = "AmazonSSMRoleForInstancesQuickSetup"
  }
}
