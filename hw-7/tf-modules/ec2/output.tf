output "instance_id" {
  value = aws_instance.ec2.id
  description = "ID of the EC2 instance"
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.main.public_ip
}