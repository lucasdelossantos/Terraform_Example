resource "aws_instance" "ec2_instance" {
  ami           = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.public_access_sg_id]
  subnet_id              = var.public_subnet_id
  associate_public_ip_address = true

  tags = {
    Name = var.ec2_instance_name
  }
}
