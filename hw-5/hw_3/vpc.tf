resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "TerraformVPC"
    }
}



# Public subnets:

resource "aws_subnet" "Public_Subnet_1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-west-2a"
    tags = {
        Name = "public_1"
    }
}

resource "aws_subnet" "Public_Subnet_2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2b"
    tags = {
        Name = "public_2"
    }
}
resource "aws_subnet" "Public_Subnet_3" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-west-2c"
    tags = {
        Name = "public_3"
    }
}




# Private subnets:

resource "aws_subnet" "Private_Subnet_1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-west-2a"
    tags = {
        Name = "private_1"
    }
}

resource "aws_subnet" "Private_Subnet_2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-west-2b"
    tags = {
        Name = "private_2"
    }
}

resource "aws_subnet" "Private_Subnet_3" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "us-west-2c"
    tags = {
        Name = "private_3"
    }
}




