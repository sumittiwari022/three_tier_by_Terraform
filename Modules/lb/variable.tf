variable "internal_name" {
  type        = string
  default     = "internal"
  description = "Internal LB Name"
}

variable "inter"{
    type=bool
    default=true
}

variable "lb_type"{
    description="Load Balancer Type"
    type=string
    default="application"
}

variable "intern_lb_sg"{
    description="Load Balancer SG"
    type=any
    default=["aws_security_group.Internal_LB.id"]
}

variable "intern_lb_sub"{
    description="Load Balancer Subnet"
    type=list(string)
    default=["aws_subnet.private_sub_1.id","aws_subnet.private_sub_2.id"]
}

variable "intern_lb_tg_name"{
    type=string
    default="PrivateTargetGroup"
}

variable "intern_lb_port"{
    type=number
    default=80
}

variable "intern_prot"{
    description="Internal LB Protocol"
    type=string
    default="HTTP"
}

variable "vpc_id"{
    type=string
    default="aws_vpc.threetiervpc.id"
}

variable "intern_tg_id"{
    type=string
    default="aws_instance.private_ec2.id"
}

variable "external_name" {
  type        = string
  default     = "external"
  description = "External LB Name"
}

variable "exter"{
    type=bool
    default=false
}

variable "extern_lb_sg"{
    description="Load Balancer SG"
    type=any
    default=["aws_security_group.External_LB.id"]
}

variable "extern_lb_sub"{
    description="Load Balancer Subnet"
    type=list(string)
    default=["aws_subnet.public_sub_1.id", "aws_subnet.public_sub_2.id"]
}

variable "extern_lb_tg_name"{
    type=string
    default="PublicTargetGroup"
}

variable "extern_tg_id"{
    type=string
    default="aws_instance.public_ec2.id"
}