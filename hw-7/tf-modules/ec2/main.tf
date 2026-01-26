
resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = var.user_data
  key_name               = var.key_name
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name        = var.name
    Environment = var.env
  }
}


module "ec2" {
  source = "git::https://github.com/orionvantix/terraform.git//hometasks/hometask-7/tf-modules/modules/ec2?ref=main"

  name          = "wordpress-ec2"
  env           = var.env
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_a.id

  vpc_security_group_ids = module.sg_web.ids

  user_data = templatefile("${path.module}/wp_userdata.sh.tpl", {
    db_name     = var.db_name
    db_user     = var.db_username
    db_password = var.db_password
    db_host     = module.rds.endpoint
  })

  key_name            = "wp-key"
  associate_public_ip = true
}
