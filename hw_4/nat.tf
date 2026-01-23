# NAT GW
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public_subnet[0].id
    depends_on = [ aws_internet_gateway.igw]
    
        
}

