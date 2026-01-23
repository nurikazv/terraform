# Public Route Table
resource "aws_route_table" "Public_Route_Table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "Public_Route_Table" }
}


# Public Route Table Associations
resource "aws_route_table_association" "Public_Route_a_1" {
  subnet_id      = aws_subnet.Public_Subnet_1.id
  route_table_id = aws_route_table.Public_Route_Table.id
}

resource "aws_route_table_association" "Public_Route_a_2" {
  subnet_id      = aws_subnet.Public_Subnet_2.id
  route_table_id = aws_route_table.Public_Route_Table.id
}

resource "aws_route_table_association" "Public_Route_a_3" {
  subnet_id      = aws_subnet.Public_Subnet_3.id
  route_table_id = aws_route_table.Public_Route_Table.id
}



# Private Route Table
resource "aws_route_table" "Private_Route_Table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = { Name = "Private_Route_Table" }
}

# Private Route Table Associations
resource "aws_route_table_association" "Private_Route_a_1" {
  subnet_id      = aws_subnet.Private_Subnet_1.id
  route_table_id = aws_route_table.Private_Route_Table.id
}

resource "aws_route_table_association" "Private_Route_a_2" {
  subnet_id      = aws_subnet.Private_Subnet_2.id
  route_table_id = aws_route_table.Private_Route_Table.id
}

resource "aws_route_table_association" "Private_Route_a_3" {
  subnet_id      = aws_subnet.Private_Subnet_3.id
  route_table_id = aws_route_table.Private_Route_Table.id
}
