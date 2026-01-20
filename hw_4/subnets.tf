resource "aws_subnet" "public_subnet" {
    count = length(var.public_cidr_blocks)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_cidr_blocks[count.index]
    availability_zone = var.az_set[count.index]
    tags = {
        Name = "public-${count.index + 1}"
    }
}


resource "aws_subnet" "private_subnet" {
    count = length(var.private_cidr_blocks)
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_cidr_blocks[count.index]
    availability_zone = var.az_set[count.index]
    tags = {
        Name = "private-${count.index + 1}"
    }
}
