ami_id                    = "ami-0f8ca728008ff5af4"
instance_type             = "t2.micro"
tag                       = "server_terraform"
key_name                  = "Key-tf"
ports                     = [80, 443, 22]
SG_tag                    = "Security_Group_Test"
SG_name                   = "SG_tf"
AG_name                   = "AS_Group"
policy_name               = "Policy for Autoscaling Group"
min_size                  = 1
max_size                  = 3
desired_capacity          = 2
health_check_grace_period = 300
health_check_type         = "EC2"
cooldown                  = "300"

// VPC

vpc_cidr          = "10.0.0.0/16"
vpc_tag           = "VPC_1_tf"
RT_cidr           = "0.0.0.0/0"
RT_tag            = "RT_1_tf"
IGW_tag           = "IGW_1_tf"
Pub_subnet_cidr_1 = "10.0.1.0/24"
Pub_subnet_AZ_1   = "ap-south-1a"
Pub_subnet_tag_1  = "Pub_Subnet_1"
Pub_subnet_cidr_2 = "10.0.2.0/24"
Pub_subnet_AZ_2   = "ap-south-1b"
Pub_subnet_tag_2  = "Pub_Subnet_2"
Pri_subnet_cidr_1 = "10.0.3.0/24"
Pri_subnet_AZ_1   = "ap-south-1a"
Pri_subnet_tag_1  = "Pri_Subnet_1"
Pri_subnet_cidr_2 = "10.0.4.0/24"
Pri_subnet_AZ_2   = "ap-south-1b"
Pri_subnet_tag_2  = "Pri_Subnet_2"

// Load_balancer

lb_name           = "LB"
listener_port     = "80"
listener_protocol = "TCP_UDP"
TG_name           = "TG"
TG_port           = "80"
TG_protocol       = "TCP_UDP"