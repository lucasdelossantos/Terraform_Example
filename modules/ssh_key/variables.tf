variable "email" {
  description = "The email address to associate with the SSH key"
  type        = string
}

variable "key_name" {
  description = "The key name for the EC2 instance"
  type        = string
}

variable "public_key_path" {
  description = "The path to the public key file"
  type        = string
}

variable "key_path" {
  description = "The path create key pair"
  type        = string
}