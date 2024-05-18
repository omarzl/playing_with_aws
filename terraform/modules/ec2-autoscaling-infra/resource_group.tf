
resource "aws_resourcegroups_group" "host_group" {
  count = var.dedicated_hosts.should_use ? 1 : 0
  name  = "${var.prefix}_host_group"
  tags  = local.tags

  configuration {
    type = "AWS::EC2::HostManagement"

    parameters {
      name   = "any-host-based-license-configuration"
      values = ["true"]
    }

    parameters {
      name   = "allowed-host-families"
      values = [var.dedicated_hosts.host_family]
    }

    parameters {
      name   = "auto-allocate-host"
      values = ["true"]
    }

    parameters {
      name   = "auto-release-host"
      values = ["true"]
    }
  }

  configuration {
    type = "AWS::ResourceGroups::Generic"
    parameters {
      name   = "allowed-resource-types"
      values = ["AWS::EC2::Host"]
    }

    parameters {
      name   = "deletion-protection"
      values = ["UNLESS_EMPTY"]
    }
  }
}
