output "rds_instance_id" {
  value = aws_db_instance.main.id
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "subnet_group_name" {
  value = aws_db_subnet_group.main.name
}
