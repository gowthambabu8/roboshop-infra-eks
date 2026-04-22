resource "aws_security_group_rule" "eks_control_plane_bastion_http" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.eks_control_plane_sg_id
}

resource "aws_security_group_rule" "eks_control_plane_eks_node" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  source_security_group_id = local.eks_node_sg_id
  security_group_id = local.eks_control_plane_sg_id
}