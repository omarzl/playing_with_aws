
resource "aws_vpc_security_group_ingress_rule" "allow_vnc_rule" {
  description       = "VNC for ARD"
  security_group_id = module.macos_dh_infra.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 5900
  ip_protocol       = "tcp"
  to_port           = 5900
}
