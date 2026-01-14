//public subnets
variable "public_cidr_blocks" {
    description = "List of public cidr blocks for public subnets"
    default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24" ]
}

// privaet subnets
variable "private_cidr_blocks" {
    description = "List of private cidr blocks for public subnets"
    default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24" ]
}


// availability zones
variable "az_set" {
    description = "availability zones"
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


//tags for public subnets
variable "public_tags" {
    type = map(string)
    description = "Common tags"
    default = {
        Name = "public-subnet"
    }
}


//tags for private subnets

variable "private_tags" {
    type = map(string)
    description = "Common tags"
    default = {
        Name = "private-subnet"
    }
}