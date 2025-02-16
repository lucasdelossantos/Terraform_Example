terraform {
  required_version = ">=1.9.2"
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  azs = var.azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  environment = var.environment
}

module "security_group" {
  source = "./modules/security_group"
  public_access_sg_name = var.public_access_sg_name
  vpc_id = module.vpc.vpc_id
}

module "ssh_key" {
  source = "./modules/ssh_key"
  email = var.email
  key_name = var.key_name
  public_key_path = var.public_key_path
  key_path = var.key_path
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ec2_instance_name = var.ec2_instance_name
  ec2_instance_ami = var.ec2_instance_ami
  ec2_instance_type = var.ec2_instance_type
  key_name = module.ssh_key.key_name
  public_access_sg_id = module.security_group.public_access_sg_id
  public_subnet_id = module.vpc.public_subnets[0]
}
