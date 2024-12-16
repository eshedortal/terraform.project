variable "security_group_name" {
    type = string
    description = "the name of the security group"
    default = "allow_ssh"
}

variable "ingress_protocol" {
    type = string
    description = "the type of ingress protocol"
    default = "tcp"
}

variable "egress_protocol" {
    type = string
    description = "the type of egress protocol"
    default = "-1"
}

variable "vpc_id" {
    type = string
}