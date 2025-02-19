variable "chef_server_instance_type" {
  description = "Instance type for the Chef server"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
}

variable "public_access_sg_id" {
  description = "Security group ID for public access"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID for the public subnet"
  type        = string
}

variable "chef_server_name" {
  description = "Name tag for the Chef server instance"
  type        = string
}