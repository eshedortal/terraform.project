resource "aws_instance" "terraform_project" {
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id     = var.subnet_id

    tags = {
        Name = var.ec2_name
    }
    vpc_security_group_ids = [var.security_group_id]
}
