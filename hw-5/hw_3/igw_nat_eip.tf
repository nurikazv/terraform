# IGW

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id
}


# NAT GW
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.Public_Subnet_1.id
    depends_on = [ aws_internet_gateway.igw ]
}

# EIP
resource "aws_eip" "nat" {}
