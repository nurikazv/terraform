resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr_blocks[count.index]
  ipv6_cidr_block = length(var.public_ipv6_cidr_blocks) > 0 ? var.public_ipv6_cidr_blocks[count.index] : cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index)

  availability_zone       = var.az_set[count.index]
  map_public_ip_on_launch = true

#   assign_ipv6_address_on_creation = true

  tags = {
    Name = "${var.public_tags}-subnet-${count.index + 1}"
    }
  
}

variable "public_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr blocks for public subnets"
  default     = [] # will calculate automatically if empty
}



resource "aws_subnet" "private_subnet" {
  count             = length(var.private_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = var.az_set[count.index]
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index + 10)
  


  assign_ipv6_address_on_creation = true

  tags = {
    Name = "${var.private_tags}-subnet-${count.index + 1}"
  }
}