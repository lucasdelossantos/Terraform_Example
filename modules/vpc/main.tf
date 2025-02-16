module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"  # Use the latest version or the version you prefer

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}
