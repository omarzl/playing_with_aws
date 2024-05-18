
resource "aws_resourcegroups_group" "ios_host_group" {
  name = "${local.prefix}_host_group"
  tags = local.tags

  configuration {
    type = "AWS::EC2::HostManagement"

    parameters {
      name = "allowed-host-based-license-configurations"
      values = [
        "${aws_licensemanager_license_configuration.license.arn}"
      ]
    }

    #    parameters {
    #      name   = "any-host-based-license-configuration"
    #      values = ["true"]
    #    }

    parameters {
      name   = "allowed-host-families"
      values = ["mac1", "mac2"]
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


#resource "aws_ec2_host" "ios_host" {
#  instance_type     = var.instance_type
#  availability_zone = "us-east-1a"
#  auto_placement    = "on"
#  host_recovery     = "on"
#}