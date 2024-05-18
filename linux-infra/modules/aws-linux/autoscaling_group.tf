
resource "aws_autoscaling_group" "linux_autoscaling_group" {
  name = "${local.prefix}_autoscaling_group"

  launch_template {
    id      = aws_launch_template.linux_template.id
    version = "$Latest"
  }

  desired_capacity = var.number_of_instances
  max_size         = 1
  min_size         = 0

  dynamic "tag" {
    for_each = local.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  availability_zones = ["us-east-1a"]
}