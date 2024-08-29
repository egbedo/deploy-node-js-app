variable "vpc_id" {
  description = "The VPC ID for the production environment"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the production environment"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "The public subnet IDs for the production environment"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the production environment"
  type        = string
}
variable "secrets" {
  description = "Secrets for the production environment"
  type        = map(string)
}
