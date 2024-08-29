variable "name" {
  description = "The name tag for the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the load balancer will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "The public subnet IDs for the load balancer"
  type        = list(string)
}



variable "aws_account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the load balancer"
  type        = string
}

variable "target_group_count" {
  description = "The number of target groups for the load balancer"
  type        = number
}