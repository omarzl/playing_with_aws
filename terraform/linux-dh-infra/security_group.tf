
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_rule" {
  description       = "SSH over 22"
  security_group_id = module.macos_dh_infra.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  depends_on = [module.macos_dh_infra.security_group]
}