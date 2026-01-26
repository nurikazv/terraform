module "instance-ec2" {
  source = "git::ssh://git@github.com/nurikazv/terraform.git//hw-7/tf-modules/ec2"

  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = module.security-group-wp.id
  user_data              = file("./userdata.sh")
  # filebase64("${path.module}/user_data.sh")
  key_name            = "MyMacKey"
  associate_public_ip = true

  tags = {
    Name        = "wordpress-ec2"
    Environment = "dev"
  }
}

output "ec2_public_ip" {
  description = "Public IP of Wordpress EC2"
  value       = module.ec2.public_ip
}

output "rds_endpoint" {
  description = "Endpoint of RDS MySql instance"
  value       = module.rds-db.endpoint
}

module "security-group-wp" {
  source = "git::ssh://git@github.com/nurikazv/terraform.git//hw-7/tf-modules/sg"

  name        = "Security Group"
  description = "Security group of EC2"
  vpc_id      = "vpc-0d7629afe601c6098"

  tags = {
    Name        = "Security Group"
    Environment = "dev"
  }

  http_cidr_blocks  = ["0.0.0.0/0"]
  ssh_cidr_blocks   = ["0.0.0.0/0"]
  mysql_cidr_blocks = []
}



module "rds-db" {
  source = "git::ssh://git@github.com/nurikazv/terraform.git//hw-7/tf-modules/rds"

  db_name    = "Wordpress-DB"
  identifier = "Wordpress"

  instance_class    = "db.t3.micro"
  allocated_storage = 20
  port              = 3306


  username = "admin"
  password = var.password

  subnet_ids = [
    aws_subnet.private_subnet_rds_1.id,
    aws_subnet.private_subnet_rds_2.id
  ]

  master_key             = true
  master_key_id          = aws_kms_key.mykey.id
  vpc_security_group_ids = [module.security-group-wp.id]


  tags = {
    Name        = "DB-Wordpress"
    Environment = "dev"
  }
}

module "subnet-group-main" {
  source = "git::ssh://git@github.com/nurikazv/terraform.git//hw-7/tf-modules/rds"

  name        = "${var.identifier}-subnet-group-wp"
  description = "Subnet group for Wordpress-DB"
  vpc_id      = "vpc-0d7629afe601c6098"

  mysql_cidrs = [aws_vpc.wp.cidr_block]

  tags = {
    Name        = "RDS Subnet Group"
    Environment = "dev"
  }
}

