## database services
module "mongo" {
  source = "../module/mongo"
  project = var.project
  environment = var.environment
}

module "mysql" {
  source = "../module/mysql"
  project = var.project
  environment = var.environment
}

module "redis" {
  source = "../module/redis"
  project = var.project
  environment = var.environment
}

module "rabbitmq" {
  source = "../module/rabbitmq"
  project = var.project
  environment = var.environment
}

# EKS
module "ingress_alb" {
  source = "../module/ingress_alb"
  project = var.project
  environment = var.environment
}

module "eks_control_plane" {
  source = "../module/eks_control_plane"
  project = var.project
  environment = var.environment
}

module "eks_node" {
  source = "../module/eks_node"
  project = var.project
  environment = var.environment
}