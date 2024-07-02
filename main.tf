terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}


# Configuration options
provider "aws" {
  region = "ap-south-1"
}

# resource "aws_instance" "S1" {
#   ami             = var.ami_id
#   instance_type   = var.instance_type
#   key_name        = aws_key_pair.test-key.key_name
#   security_groups = [aws_security_group.SG.name]
#   #   subnet_id      = var.subnet_id 
#   tags = {
#     Name = var.tag
#   }
# }

// Module use for Auto Scalling Group

module "Autoscaling" {
  source                    = "./modules/Auto_Scaling_Group"
  AG_name                   = var.AG_name
  policy_name               = var.policy_name
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  vpc_zone_identifier       = [module.aws_vpc.Pub_subnet_id_1, module.aws_vpc.Pub_subnet_id_2]
  key                       = file("${path.module}/key-tf.pub")
  key_name                  = var.key_name
  ports                     = var.ports
  SG_tag                    = var.SG_tag
  SG_name                   = var.SG_name
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  cooldown                  = var.cooldown
  lb_target_group_arn       = module.load_balancer.arn
  vpc_id                    = module.aws_vpc.vpc_id
}

# Calling Module for VPC


module "aws_vpc" {
  source            = "./modules/aws_vpc"
  vpc_cidr          = var.vpc_cidr
  vpc_tag           = var.vpc_tag
  IGW_tag           = var.IGW_tag
  RT_cidr           = var.RT_cidr
  RT_tag            = var.RT_tag
  Pub_subnet_cidr_1 = var.Pub_subnet_cidr_1
  Pub_subnet_AZ_1   = var.Pub_subnet_AZ_1
  Pub_subnet_tag_1  = var.Pub_subnet_tag_1
  Pub_subnet_cidr_2 = var.Pub_subnet_cidr_2
  Pub_subnet_AZ_2   = var.Pub_subnet_AZ_2
  Pub_subnet_tag_2  = var.Pub_subnet_tag_2
  Pri_subnet_cidr_1 = var.Pri_subnet_cidr_1
  Pri_subnet_AZ_1   = var.Pri_subnet_AZ_1
  Pri_subnet_tag_1  = var.Pri_subnet_tag_1
  Pri_subnet_cidr_2 = var.Pri_subnet_cidr_2
  Pri_subnet_AZ_2   = var.Pri_subnet_AZ_2
  Pri_subnet_tag_2  = var.Pri_subnet_tag_2


}

// load balncer module called

module "load_balancer" {
  source = "./modules/Load_balancer"

  lb_name           = var.lb_name
  lb_subnets        = [module.aws_vpc.Pub_subnet_id_1, module.aws_vpc.Pub_subnet_id_2]
  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol
  TG_name           = var.TG_name
  TG_port           = var.TG_port
  TG_protocol       = var.TG_protocol
  vpc_id            = module.aws_vpc.vpc_id
}
