
resource "aws_autoscaling_group" "linux_autoscaling_group" {
  name                  = "${local.prefix}_autoscaling_group"
  protect_from_scale_in = false

  launch_template {
    id      = aws_launch_template.linux_template.id
    version = "$Latest"
  }

  max_size         = var.max_number_of_instances
  min_size         = 0
  # The Jenkins plugin will update the desired capacity
  desired_capacity = 0

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