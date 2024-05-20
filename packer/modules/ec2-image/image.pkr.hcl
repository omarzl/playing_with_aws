
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
  ami_name      = "demo-${var.ami_identifier}-${local.timestamp}"
  instance_type = var.intance_type
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name = var.base_ami_name
    }
    owners = ["amazon"]
  }
  ssh_username = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.new_image"]

  provisioner "shell" {
    script = var.script_path
  }
}
