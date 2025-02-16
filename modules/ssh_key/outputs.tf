output "key_name" {
  description = "The key name for the EC2 instance"
  value       = aws_key_pair.tf_key.key_name
}
