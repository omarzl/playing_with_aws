
locals {

  required_tags = {
    team = "iOS"
  }

  tags = merge(var.resource_tags, local.required_tags)
}
