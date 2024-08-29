variable "name" {
  description = "The name tag for the EC2 instances"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the EC2 instances will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the EC2 instances"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "git_repo" {
  description = "GitHub repository for the Node.js app"
  type        = string
}
