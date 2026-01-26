resource "aws_db_subnet_group" "main" {
  name       = "${var.identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = var.tags
}

resource "aws_db_instance" "main" {
  identifier = var.identifier
  db_name    = var.db_name

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  port              = var.port

  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.vpc_security_group_ids

  storage_encrypted = var.master_key
  kms_key_id        = var.master_key ? var.master_key_id : null

  skip_final_snapshot = true

  tags = var.tags
}
