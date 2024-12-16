terraform {
    backend "s3" {
        bucket = "terraform-project-remote-state-eshed"
        key = "network_project_terraform.tfstate"
        region = "eu-west-1"
    }
}