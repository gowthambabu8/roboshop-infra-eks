locals {
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  
  # databases
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  mongo_sg_id = data.aws_ssm_parameter.mongo_sg_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value

  # eks
  ingress_alb_sg_id = data.aws_ssm_parameter.ingress_alb_sg_id.value

  # ports and services
  common_port = 22
  mongo_service_port = 27017
  redis_service_port = 6379
  mysql_service_port = 3306
  rabbitmq_service_port = 5672
  http_port = 80
  https_port = 443
  backend_service_port = 8080

}