
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

  user_data = filebase64("${path.module}/user-data.sh")
}
