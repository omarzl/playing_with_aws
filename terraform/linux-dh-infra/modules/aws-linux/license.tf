
resource "aws_licensemanager_license_configuration" "license" {
  name                     = "${local.prefix}_license"
  license_count            = 1
  license_count_hard_limit = false
  license_counting_type    = "Core"
  tags                     = local.tags
}