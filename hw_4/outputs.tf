output "vpc_id" {
  description = "VPC's ID"
  value = aws_vpc.main.id
}


output "public_subnet_ids" {
  description = "IDs of public subnets"
  value = [for subnets in aws_subnet.public_subnet : subnets.id]
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value = [for subnets in aws_subnet.private_subnet : subnets.id]
}
