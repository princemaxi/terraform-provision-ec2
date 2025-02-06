# Terraform AWS EC2 Provisioning

This project demonstrates how to use Terraform to provision an Amazon EC2 instance on AWS. It provides step-by-step instructions to set up Terraform, configure an AWS EC2 instance, and deploy it using Terraform commands.

## Prerequisites
Before getting started, ensure you have the following:

1. **AWS Account** – Sign up at [AWS Console](https://aws.amazon.com/) if you don’t have one.
2. **AWS CLI Installed & Configured**
   - Install AWS CLI: [Download Here](https://aws.amazon.com/cli/)
   - Configure with: `aws configure`
3. **Terraform Installed**
   - **Windows:** Download and install from [Terraform Official Site](https://developer.hashicorp.com/terraform/downloads)
   - **MacOS:** Install via Homebrew:
     ```bash
     brew tap hashicorp/tap
     brew install hashicorp/tap/terraform
     ```
   - **Linux:** Install via package manager:
     ```bash
     sudo apt update && sudo apt install -y terraform
     ```

## Step 1: Get a Free AMI from AWS AMI Catalog
Find a suitable Amazon Machine Image (AMI) from the [AWS AMI Catalog](https://aws.amazon.com/marketplace) and note its **AMI ID**. In this guide, we use `ami-0cbf43fd299e3a464`.

## Step 2: Create a Terraform Configuration File
Create a new directory for your Terraform project and navigate into it:
```bash
mkdir terraform-ec2 && cd terraform-ec2
```
Create a `main.tf` file with the following configuration:

```hcl
provider "aws" {
    profile = "default"
    region  = "eu-west-2"
}

resource "aws_instance" "UGO_Server" {
    ami           = "ami-0cbf43fd299e3a464"
    instance_type = "t2.micro"

    tags = {
        Name = "MyNCAAInstance"
    }
}
```

### Explanation of `main.tf`:
- **provider "aws"** – Configures AWS as the provider and specifies the region.
- **resource "aws_instance"** – Defines an EC2 instance with:
  - `ami` – The AMI ID to use.
  - `instance_type` – The instance size (`t2.micro` for free tier).
  - `tags` – Assigns a name to the instance.

## Step 3: Initialize Terraform
Before applying the configuration, initialize Terraform to download necessary provider plugins:
```bash
terraform init
```

## Step 4: Apply Configuration and Create the EC2 Instance
To provision the EC2 instance, run:
```bash
terraform apply
```
Terraform will prompt for confirmation. Type `yes` to proceed. Once applied, Terraform outputs the resources created.

## Step 5: Verify EC2 Instance on AWS
Go to the [AWS EC2 Console](https://console.aws.amazon.com/ec2) to verify the instance is running in the specified region.

## Step 6: Destroy the Infrastructure (Cleanup)
To remove the EC2 instance when done, run:
```bash
terraform destroy
```
Again, type `yes` when prompted.

## Understanding Terraform
Terraform is an **Infrastructure as Code (IaC)** tool that allows you to define cloud resources in a declarative format. Benefits include:
- **Automated provisioning** – Consistently deploy infrastructure.
- **Version control** – Manage infrastructure changes with Git.
- **Multi-cloud support** – Works with AWS, Azure, GCP, and more.

---
### 🚀 Happy Terraforming! 🚀
For any questions, feel free to reach out!
