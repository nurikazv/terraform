resource "aws_db_instance" "main" {
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_class


  allocated_storage    = var.allocated_storage


  db_name              = var.db_name
  identifier           = var.identifier
  username             = var.username
  password             = var.password
  
  identifier           = var.identifier
  port                 = var.port

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot  = true

  tags = {
    Name = var.name
  }
}




resource "aws_db_subnet_group" "main" {
  name        = var.subnet_group_name
  description = var.description_subnet_group
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}


