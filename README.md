# Terraform Project
## Diagram
![Picture1](https://github.com/user-attachments/assets/b6106bff-a90f-45db-b2b8-25de9cb05943)

## Overview
This repository contains a Terraform project structured into two distinct modules:

### 1. **network_terraform_project**
Responsible for creating the foundational network infrastructure:
- Virtual Private Cloud (VPC).
- Public subnets.

### 2. **server_terraform_project**
Handles the deployment of compute resources within the network:
- EC2 instances.
- Security groups.

Both projects are designed to work together while maintaining independent state management.

---

## Project Architecture
The project follows a modular structure with the following workflow:

1. **Deploy the Network**
   - Start with the `network_terraform_project` to set up the VPC and public subnets.
   - Outputs (e.g., VPC ID, Subnet IDs) are stored in a shared S3 bucket as a state file.

2. **Deploy the Servers**
   - Proceed to the `server_terraform_project` to deploy resources.
   - This project references the outputs of the `network_terraform_project` by accessing its state file stored in the S3 bucket.

---

## Deployment Sequence

1. **Deploy `network_terraform_project`:**
   - Run the Terraform configuration for this project to create the network infrastructure.
   - Ensure that all relevant outputs (VPC ID, Subnet IDs) are stored in the state file.

2. **Deploy `server_terraform_project`:**
   - Use the outputs from `network_terraform_project` to configure and deploy resources like EC2 instances and security groups.

---

## State Management

### S3 Bucket Configuration:
- Both projects use the same S3 bucket for storing their Terraform state files but manage them independently using separate files.

| Project                  | State File Name                     |
|--------------------------|--------------------------------------|
| `network_terraform_project` | `network_project_terraform.tfstate` |
| `server_terraform_project`  | `server_project_terraform.tfstate`  |

### Remote State Linking:
- `server_terraform_project` uses the remote state of `network_terraform_project` to retrieve necessary outputs.

---

## Prerequisites

- Terraform installed locally.
- Git installed locally.
- AWS CLI configured with appropriate credentials.
- S3 bucket created and accessible for storing state files.

---

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/eshedortal/terraform.project.git
   cd ./terraform.project

2. Initialize and deploy the `network_terraform_project`:
   ```bash
   cd network_terraform_project
   terraform init
   terraform apply

3. Initialize and deploy the `server_terraform_project`:
   ```bash
   cd server_terraform_project
   terraform init
   terraform apply

