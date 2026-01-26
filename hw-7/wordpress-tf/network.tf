resource "aws_internet_gateway" "wp" {
  vpc_id = "vpc-0d7629afe601c6098"

  tags = {
    Name = "igw"
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id                  = "vpc-0d7629afe601c6098"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "wp-public-a"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "vpc-0d7629afe601c6098"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp.id
  }

  tags = {
    Name = "wp-public-rt"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}








resource "aws_subnet" "private_subnet_rds-1" {
  vpc_id            = "vpc-0d7629afe601c6098"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "wp-db-a"
  }
}
resource "aws_subnet" "private_subnet_rds-2" {
  vpc_id            = "vpc-0d7629afe601c6098"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "wp-db-b"
  }
}



