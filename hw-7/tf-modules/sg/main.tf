resource "aws_security_group" "main" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.tags
  } 
}


resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.main.id
  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
  cidr_blocks = var.http_cidr_blocks
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.main.id
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_blocks = var.ssh_cidr_blocks
}

resource "aws_vpc_security_group_ingress_rule" "mysql" {
  security_group_id = aws_security_group.main.id
  ip_protocol = "tcp"
  from_port   = 3306
  to_port     = 3306
  cidr_blocks = var.mysql_cidrs_blocks

}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.main.id
  ip_protocol = "-1"
  cidr_blocks   = ["0.0.0.0/0"]
}

