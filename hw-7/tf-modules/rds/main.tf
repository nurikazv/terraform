resource "aws_db_instance" "main" {
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_class

  allocated_storage    = var.allocated_storage

  db_name              = var.db_name
  # identifier           = var.ident
  username             = var.username
  password             = var.password

  port                 = var.port

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot  = true

  tags = {
    Name = var.name
  }
}



