provider "aws" {
  region = "us-east-1"
}

module "node-js-app" {
  source = "../../Modules/node-js-app"
  environment = "QA"
    name = "node-js-app"
    vpc_id = "var.vpc_id"
    subnet_id = "var.subnet_id"
    
}

module "load_balancer" {
  source = "../../Modules/load_balancer"
  environment = "QA"
    name = "load-balancer"
    vpc_id = "var.vpc_id"
    public_subnet_id = "var.public_subnet_id"
    security_group_id = "var.security_group_id"
    target_group_arn = "module.node-js-app.target_group_arn"
}

module "secrets_manager" {
    source = "../modules/secerts_manager"
    secrets = var.secrets
}