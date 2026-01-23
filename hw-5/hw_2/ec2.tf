resource "aws_instance" "first_ec2" {
  ami           = "ami-00a8151272c45cd8e"
  instance_type = "t2.micro"
  tags = {
    Name        = "first"
    Environment = "dev"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              dnf install -y httpd
              systemctl enable httpd
              systemctl start httpd

              echo "<html><body><h1>Session-2 homework is complete! </h1></body></html>" > /var/www/html/index.html
              EOF
}  