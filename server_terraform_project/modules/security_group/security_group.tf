resource "aws_security_group" "allow_ssh" {
    name = var.security_group_name
    description = "Allow SSH inbound traffic"
    vpc_id = var.vpc_id
    tags= {
        Name = var.security_group_name
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = var.ingress_protocol
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = var.egress_protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
}
