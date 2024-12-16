terraform {
    backend "s3" {
        bucket = "terraform-project-remote-state-eshed"
        key = "server_project_terraform.tfstate"
        region = "eu-west-1"
    }
}