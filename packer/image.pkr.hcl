
packer {
  required_plugins {
    amazon = {
      version = "~> 1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "new_image" {
  ami_name                = "demo-${var.ami_identifier}-${local.timestamp}"
  ami_virtualization_type = "hvm"
  instance_type           = var.intance_type
  region                  = "us-east-1"
  source_ami_filter {
    filters = {
      name = var.base_ami_name
    }
    owners = ["amazon"]
  }
  ssh_username  = "ec2-user"
  ssh_timeout   = "2h"
  tenancy       = "host"
  ebs_optimized = true
  aws_polling {
    delay_seconds = 60
    max_attempts  = 60
  }

  temporary_iam_instance_profile_policy_document {
    Version = "2012-10-17"
    Statement {
      Effect = "Allow"
      Action = [
        "ssm:DescribeAssociation",
        "ssm:GetDeployablePatchSnapshotForInstance",
        "ssm:GetDocument",
        "ssm:DescribeDocument",
        "ssm:GetManifest",
        "ssm:GetParameter",
        "ssm:GetParameters",
        "ssm:ListAssociations",
        "ssm:ListInstanceAssociations",
        "ssm:PutInventory",
        "ssm:PutComplianceItems",
        "ssm:PutConfigurePackageResult",
        "ssm:UpdateAssociationStatus",
        "ssm:UpdateInstanceAssociationStatus",
        "ssm:UpdateInstanceInformation"
      ]
      Resource = ["*"]
    }
    Statement {
      Effect = "Allow"
      Action = [
        "ssmmessages:CreateControlChannel",
        "ssmmessages:CreateDataChannel",
        "ssmmessages:OpenControlChannel",
        "ssmmessages:OpenDataChannel"
      ]
      Resource = ["*"]
    }
    Statement {
      Effect = "Allow"
      Action = [
        "ec2messages:AcknowledgeMessage",
        "ec2messages:DeleteMessage",
        "ec2messages:FailMessage",
        "ec2messages:GetEndpoint",
        "ec2messages:GetMessages",
        "ec2messages:SendReply"
      ]
      Resource = ["*"]
    }
  }
}

build {
  sources = ["source.amazon-ebs.new_image"]

  provisioner "shell" {
    script = var.script_path
  }

  provisioner "breakpoint" {
    disable = false
    note    = "when you are ready, continue to delete the instance and save the AMI"
  }
}
