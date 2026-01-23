resource "aws_launch_template" "launch-template" {
  image_id      = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type


  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [ aws_security_group.ec2-sg.id ]
  }

  user_data = filebase64("${path.module}/user_data.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.ec2}-${count.index + 1}"
    }
  }
}

 
data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.10.*"]   
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}



