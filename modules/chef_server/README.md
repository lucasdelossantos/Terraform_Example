# Chef Server Module

This module provisions an EC2 instance to be used as a Chef server.

## Variables

- `chef_server_ami`: AMI ID for the Chef server
- `chef_server_instance_type`: Instance type for the Chef server
- `key_name`: Key name for SSH access
- `public_access_sg_id`: Security group ID for public access
- `public_subnet_id`: Subnet ID for the public subnet
- `chef_server_name`: Name tag for the Chef server instance

## Outputs

- `chef_server_id`: ID of the Chef server instance
- `chef_server_public_ip`: Public IP address of the Chef server instance