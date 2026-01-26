variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch the instance in"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "VPC security group IDs for the instance"
  default     = []
}

variable "user_data" {
  type        = string
  description = "User data script for EC2"
  default     = ""
}

variable "key_name" {
  type        = string
  description = "Key pair name for EC2"
  default     = ""
}

variable "associate_public_ip" {
  type        = bool
  description = "Whether to assign a public IP"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags for EC2 instance"
  default     = {}
}
