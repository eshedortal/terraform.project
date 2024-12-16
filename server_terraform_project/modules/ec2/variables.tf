variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0a422d70f727fe93e"
}

variable "instance_type" {
    type = string
    description = "the instance type of the ec2"
    default = "t2.micro"
}

variable "ec2_name" {
    type = string
    description = "the name of the ec2"
    default = "terraform_project_instance"
}

variable "security_group_id" {
    type = string
}

variable "subnet_id" {
    type = string
}
