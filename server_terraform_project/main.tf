module "ec2" {
    source = "./modules/ec2"
    security_group_id = module.security_group.sg_ec2_id
    subnet_id = data.terraform_remote_state.network_tf_project.outputs.subnet_id
}

module "security_group" {
    source = "./modules/security_group"
    vpc_id = data.terraform_remote_state.network_tf_project.outputs.vpc_id
}

data "terraform_remote_state" "network_tf_project" {
    backend = "s3" 
    config = {
        bucket = "terraform-project-remote-state-eshed"
        key = "network_project_terraform.tfstate"
        region = "eu-west-1"
    }
}