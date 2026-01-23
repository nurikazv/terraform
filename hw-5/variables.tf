variable "sg" {
  type        = string
  default     = "Security Group tag"
  description = "security-group"
}

variable "pub" {
    type = string
    default = "Public Component"
    description = "public"
}

variable "private" {
    type = string
    default = "Private Component"
    description = "private"
}


variable "ec2"{
  type        = string
  description = "Homewrok-5 Instance"
  default     = "hw5-instance"
}

variable "domain_name" {
  type = string
  description = "Variable for DNS name"
  default = "aws-zizu.com"
}