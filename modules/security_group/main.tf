module "public_access_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"  # Use the latest version or the version you prefer

  name        = var.public_access_sg_name
  description = "Allow public access"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = {
    Name = var.public_access_sg_name
  }
}
