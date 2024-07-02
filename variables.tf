
variable "instance_type" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "tag" {
  type = string
}
variable "key_name" {
  type = string
}
variable "ports" {
  type = list(number)
}
variable "SG_tag" {
  type = string
}
variable "SG_name" {
  type = string
}
variable "AG_name" {
  type = string
}
variable "policy_name" {
  type = string
}
variable "min_size" {
  type = string
}
variable "max_size" {
  type = string
}
variable "desired_capacity" {
  type = string
}
variable "health_check_grace_period" {
  type = string

}
variable "health_check_type" {
  type = string
}
variable "cooldown" {
  type = string
}

# VPC

variable "vpc_cidr" {
  type = string

}
variable "vpc_tag" {
  type = string

}
variable "IGW_tag" {
  type = string

}
variable "RT_cidr" {
  type = string

}
variable "RT_tag" {
  type = string

}
variable "Pri_subnet_cidr_1" {
  type = string

}
variable "Pri_subnet_AZ_1" {
  type = string

}
variable "Pri_subnet_tag_1" {
  type = string

}
variable "Pri_subnet_cidr_2" {
  type = string

}
variable "Pri_subnet_AZ_2" {
  type = string

}
variable "Pri_subnet_tag_2" {
  type = string

}

variable "Pub_subnet_cidr_1" {
  type = string

}
variable "Pub_subnet_AZ_1" {
  type = string

}
variable "Pub_subnet_tag_1" {
  type = string

}
variable "Pub_subnet_cidr_2" {
  type = string

}
variable "Pub_subnet_AZ_2" {
  type = string

}
variable "Pub_subnet_tag_2" {
  type = string

}

# load balancer

variable "lb_name" {
  type = string

}
variable "listener_port" {
  type = string
}
variable "listener_protocol" {

}
variable "TG_name" {
  type = string

}
variable "TG_protocol" {
  type = string

}
variable "TG_port" {
  type = string

}