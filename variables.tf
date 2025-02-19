variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "main-vpc"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "The availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  description = "The private subnets for the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "The public subnets for the VPC"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Enable VPN Gateway"
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "dev"
}

variable "public_access_sg_name" {
  description = "The name of the public access security group"
  type        = string
  default     = "public-access-sg"
}

variable "ec2_instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "ubuntu-server-22.0.4"
}

variable "ec2_instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0e1bed4f06a3b463d"
}

variable "ec2_instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "The path to the public key file"
  type        = string
  default     = "tf_user.pub"  # Replace with the actual path to your public key file
}

variable "key_name" {
  description = "The key name for the EC2 instance"
  type        = string
  default     = "tf_user"
}

variable "key_path" {
  description = "The path to create key pair"
  type        = string
  default     = "modules/ssh_key/tf_user"  # Replace with the actual path to your private key file
  
}

variable "email" {
  description = "The email address to associate with the SSH key"
  type        = string
  default     = "lucas.delossantos@snhu.edu"  # Replace with your actual email address
}

variable "chef_server_name" {
  description = "Name tag for the Chef server instance"
  type        = string
  default     = "tf_example_chef_server"
}