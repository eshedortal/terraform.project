output "vpc_id" {
    value = aws_vpc.network_tf_project.id
}

output "subnet_id" {
    value = aws_subnet.public_subnet_1.id
}