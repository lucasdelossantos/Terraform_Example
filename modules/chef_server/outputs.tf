output "chef_server_id" {
  description = "ID of the Chef server instance"
  value       = aws_instance.chef_server.id
}

output "chef_server_public_ip" {
  description = "Public IP address of the Chef server instance"
  value       = aws_instance.chef_server.public_ip
}