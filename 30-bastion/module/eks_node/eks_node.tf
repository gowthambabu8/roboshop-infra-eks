resource "aws_security_group_rule" "eks_node_eks_control_plane" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  source_security_group_id = local.eks_control_plane_sg_id
  security_group_id = local.eks_node_sg_id
}

resource "aws_security_group_rule" "eks_node_vpc_cidr_block" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["10.0.0.0/16"]
  security_group_id = local.eks_node_sg_id
}

resource "aws_security_group_rule" "eks_node_bastion" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "TCP"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.eks_node_sg_id
}