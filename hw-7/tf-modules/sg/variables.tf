variable "name" {
    type = string
    description = "Name of the Security Group"
}
variable "description" {
    type = string
    description = "Description of the Security Group"

}
variable "vpc_id" {
    type = string
    description = "ID of VPC"
}
variable "tags" {
    type = string
    description = "Security Group's tags"
}

variable "http_cidr_blocks" {
    type = list(string)
    description = "CIDR blocks for http"
    default 
}
variable "ssh_cidr_blocks" {
    type = list(string)
    description = "CIDR blocks for ssh"

}
variable "mysql_cidrs_blocks" {
    type = list(string)
    description = "CIDR blocks for ssh"

}

