
resource "aws_licensemanager_license_configuration" "license" {
  count                    = var.dedicated_hosts.should_use ? 1 : 0
  name                     = "${var.prefix}_license"
  license_count            = var.max_number_of_instances
  license_count_hard_limit = false
  license_counting_type    = "Core"
  tags                     = local.tags
}