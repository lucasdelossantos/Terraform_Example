variable "ec2_instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "ec2_instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key name for the EC2 instance"
  type        = string
}

variable "public_access_sg_id" {
  description = "The ID of the public access security group"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}
