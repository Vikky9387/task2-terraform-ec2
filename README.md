AWS EC2 Deployment Using Terraform (Manual + IaC)

Project Overview

This project demonstrates hands-on understanding of AWS core services and Infrastructure as Code (IaC) using Terraform.  

It covers both:

&nbsp;Manual EC2 provisioning using the AWS Management Console  

&nbsp;Automated EC2 provisioning using Terraform  

&nbsp;The goal is to gain practical experience in deploying and managing cloud infrastructure.

Tools \& Technologies Used:

&nbsp;AWS Cloud Platform

&nbsp;Amazon EC2

&nbsp;Terraform

&nbsp;AWS CLI

&nbsp;Git \& GitHub

&nbsp;Command Line / Git Bash / PowerShell

AWS Core Concepts (Quick Notes)

EC2 (Elastic Compute Cloud)

Amazon EC2 provides scalable virtual servers that can be launched and managed on-demand.

AMI (Amazon Machine Image)

An AMI is a pre-configured template containing an operating system and required configurations used to launch an EC2 instance.

Security Groups

Security Groups act like a virtual firewall that controls inbound and outbound traffic for EC2 instances.

Key Pair

Key Pairs are used for secure authentication (SSH login) into EC2 instances.

IAM (Identity and Access Management)

IAM is used to manage AWS users, roles, permissions, and access policies securely.

Part 1: Manual EC2 Instance Creation (AWS Console)

Step 1: Launch Instance

Go to AWS Console → EC2 → Launch Instance and configure:

Name: manual-ec2-instance

AMI: Amazon Linux 2023

Instance Type: t3.micro (Free Tier Eligible)

Key Pair: Create new / select existing key pair

Security Group Rules:

&nbsp; - Allow SSH (22) → My IP

&nbsp; - Allow HTTP (80) → Anywhere ( For testing)

Click Launch Instance

Step 2: Verify Instance

Go to EC2 → Instances and confirm:

Instance state: Running

&nbsp;Public IPv4 address is assigned

Part 2: EC2 Provisioning Using Terraform

Step 1: Install Terraform

Download Terraform from HashiCorp:

https://developer.hashicorp.com/terraform/downloads

Verify installation:

terraform -version

Install and Configure AWS CLI

Download AWS CLI:

https://aws.amazon.com/cli/

Verify installation:

aws --version

Configure AWS credentials:

aws configure

Enter:

AWS Access Key ID

AWS Secret Access Key

Default Region: us-east-2

Output format: json

&nbsp;Validate authentication:

aws sts get-caller-identity

Step 3: Create Terraform Project Directory

Create a new directory and move inside it:

mkdir terraform-ec2-task

cd terraform-ec2-task

Create the Terraform files:

notepad provider.tf

paste this :



terraform {

&nbsp; required\_providers {

&nbsp;   aws = {

&nbsp;     source  = "hashicorp/aws"

&nbsp;     version = "~> 5.0"

&nbsp;   }

&nbsp; }

}

provider "aws" {

&nbsp; region = "us-east-2"

}

Step 4: Terraform Configuration (ec2.tf)

nano ec2.tf

Paste the following code:

resource "aws\_instance" "task2\_ec2" {

&nbsp; ami           = "ami-03ea746da1a2e36e7" # Amazon Linux 2023 (us-east-2) 

&nbsp; instance\_type = "t3.micro"

tags = {

&nbsp;   Name = "task2-terraform-ec2"

&nbsp; }

}

Step 5: Initialize Terraform

terraform init

This downloads the required AWS provider plugins.

Step 6: Validate the Configuration

terraform validate

Step 7: Preview the Deployment Plan

terraform plan

&nbsp;Shows what Terraform will create before applying changes.

Step 8: Apply the Terraform Configuration

terraform apply -auto-approve

&nbsp;Terraform provisions the EC2 instance in AWS.

Step 9: Verify EC2 Instance on AWS

Go to:

AWS Console → EC2 Dashboard → Instances

Confirm the instance named:

terraform-ec2-instance

Status: Running

Step 10: Destroy Infrastructure 

After testing, destroy the resources:

terraform destroy -auto-approve

This removes all created infrastructure.



