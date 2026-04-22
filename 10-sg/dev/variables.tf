variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
  default = "jskjdgs"
}

variable "sg_names"{
  default = [ 
    # databases
    "mongo","redis","mysql","rabbitmq",
    "ingress_alb",
    "bastion",
    "eks_control_plane","eks_node"
  ]
}