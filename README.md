# Deploy a Node.js application using Terraform. 
## Overview

#### This project demonstrates how to deploy a Node.js application using Terraform. The deployment is structured to support multiple environments, including Development, QA, and Production, utilizing reusable Terraform modules for efficient infrastructure management.

#### Features

1. Infrastructure as Code (IaC) with Terraform

2. Modular Terraform setup for reusability across environments

3. Deployment across Development, QA, and Production

4. Automated provisioning of cloud resources

5. Scalable and maintainable infrastructure

### Prerequisites

Before running this project, ensure you have the following installed:

1. Terraform

2. Node.js

3. Cloud provider CLI (AWS CLI)

4. Proper authentication and access to your cloud provider

### Deployment Steps

####  Set Up Terraform Project Structure

1. Define a modular structure for reusability across environments.

2. Create directories for environments (dev, qa, staging, prod).

3. Set up Terraform configuration files.

#### Create EC2 Instances for the Application

1. Define an EC2 module for the Node.js application.

2. Ensure three separate EC2 instances are created.

3. Configure security groups to restrict access.

#### Configure Load Balancer with Separate Routes

1. Create an Application Load Balancer (ALB).

2. Define separate routing rules for different environments.

3. Ensure the ALB is accessible within a private network.

#### Store Environment Variables in AWS Secrets Manager

1. Create secrets for each environment.

2. Configure Terraform to retrieve secrets and inject them into EC2 instances.

#### Deploy and Test

1. Initialize Terraform and apply configurations.

2. Verify EC2 instances, ALB routes, and environment variables.

3. Test application accessibility.


