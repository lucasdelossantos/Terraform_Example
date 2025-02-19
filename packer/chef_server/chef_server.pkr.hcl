packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

variable "chef_username" {
  type = string
}

variable "chef_fullname" {
  type = string
}

variable "chef_email" {
  type = string
}

variable "chef_password" {
  type = string
}

variable "chef_orgname" {
  type = string
}

variable "chef_orgname_full" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ssh_username" {
  type = string
}

variable "ami_name_prefix" {
  type = string
}

source "amazon-ebs" "chef_server" {
  region                    = var.aws_region
  instance_type             = var.instance_type
  ssh_username              = var.ssh_username
  ami_name                  = "${var.ami_name_prefix}-${local.timestamp}"
  ami_description           = "Chef Server AMI built with Packer"
  associate_public_ip_address = true
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type     = "ebs"
      virtualization-type  = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
}

build {
  sources = ["source.amazon-ebs.chef_server"]

  provisioner "shell" {
    script = "install_chef.sh"
    environment_vars = [
      "CHEF_USERNAME=${var.chef_username}",
      "CHEF_FULLNAME=${var.chef_fullname}",
      "CHEF_EMAIL=${var.chef_email}",
      "CHEF_PASSWORD=${var.chef_password}",
      "CHEF_ORGNAME=${var.chef_orgname}",
      "CHEF_ORGNAME_FULL=${var.chef_orgname_full}"
    ]
  }
}