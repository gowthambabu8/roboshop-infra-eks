resource "aws_security_group_rule" "ingress_bastion_http" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = local.ingress_alb_sg_id
}