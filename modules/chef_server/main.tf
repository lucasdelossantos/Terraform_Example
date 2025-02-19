data "aws_ami" "chef_server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["chef-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"]
}

resource "aws_instance" "chef_server" {
  ami           = data.aws_ami.chef_server.id
  instance_type = var.chef_server_instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.public_access_sg_id]
  subnet_id              = var.public_subnet_id
  associate_public_ip_address = true

  tags = {
    Name = var.chef_server_name
  }
}