module "instance-ec2" {
    source = "git::"

    instace_type = "t3.micro"
    security_group_id = module.security-group-wp.id
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = module.security-group-wp.id
    user_data = file("./userdata.sh")
    # filebase64("${path.module}/user_data.sh")
    key_name = 
    associate_public_ip = true

    tags {
        Name = "wordpress-ec2"
        Environment = "dev"
    }
}

output "ec2_public_ip" {
  description = "Public IP of Wordpress EC2"
  value       = module.ec2.public_ip
}




# output "rds_endpoint" {
#   description = "RDS endpoint"
#   value       = module.rds.endpoint
# }

module "security-group-wp" {
    source = "git::"

    name = "Security Group"
    description = "Security group of EC2"
    vpc_id = "vpc-0d7629afe601c6098"

    tags = {
        Name = "Security Group"
        Environment = "dev"
    }

    http_cidrs  = ["0.0.0.0/0"]
    ssh_cidrs   = ["0.0.0.0/0"]
    mysql_cidrs = []
}



module "rds-db" {
    source = "git::"

    db_name              = "Wordpress-DB"
    identifier           = "Wordpress"

    instance_class       = "db.t3.micro"
    allocated_storage    = "20"
    port                 = "3306"


    username             = var.username
    password             = var.password

    tags {
        Name = "DB-Wordpress"
        Environment = "dev"
    }
}

module "subnet-group-main" {
    source = "git::"

    name = "subnet-group-wp"
    description = "Subnet group for Wordpress-DB"
    vpc_id = "vpc-0d7629afe601c6098"

    mysql_cidrs = [aws_vpc.wp.cidr_block]

    tags {
        Name = "RDS Subnet Group"
        Environment = "dev"
    }
}
