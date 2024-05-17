run "plan_executed" {
  command = plan
}

override_resource {
  target = aws_licensemanager_license_configuration.license
}