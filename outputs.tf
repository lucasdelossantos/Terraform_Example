output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_access_sg_id" {
  description = "The ID of the public access security group"
  value       = module.security_group.public_access_sg_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr
}

output "private_subnets" {
  description = "The private subnets of the VPC"
  value       = module.vpc.private_subnets
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_instance.ec2_instance_id
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2_instance.ec2_instance_public_ip
}

output "ec2_instance_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = module.ec2_instance.ec2_instance_private_ip
}

output "ssh_command" {
  description = "SSH command to connect to the EC2 instance"
  value       = "ssh -i ${var.key_path} ubuntu@${module.ec2_instance.ec2_instance_public_ip}"
}

output "chef_server_id" {
  description = "The ID of the Chef server"
  value       = module.chef_server.chef_server_id
}

output "chef_server_public_ip" {
  description = "The public IP of the Chef server"
  value       = module.chef_server.chef_server_public_ip
}

output "chef_server_ssh_command" {
  description = "SSH command to connect to the Chef server"
  value       = "ssh -i ${var.key_path} ubuntu@${module.chef_server.chef_server_public_ip}"
}

output "chef_server_manage_site" {
  description = "The URL of the Chef server management console"
  value       = "https://${module.chef_server.chef_server_public_ip}/login"
}