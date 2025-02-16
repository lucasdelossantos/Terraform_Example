output "public_access_sg_id" {
  description = "The ID of the public access security group"
  value       = module.public_access_sg.security_group_id
}
