
locals {
  prefix = "ios"

  required_tags = {
    team = "ios"
  }

  tags = merge(var.resource_tags, local.required_tags)
}
