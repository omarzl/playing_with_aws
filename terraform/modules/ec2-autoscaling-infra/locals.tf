
locals {
  prefix = "linux"

  required_tags = {
    team = "linux"
  }

  tags = merge(var.resource_tags, local.required_tags)
}
