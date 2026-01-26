
variable "db_name" {
  type        = string
  description = "Initial Data Base name"
}

variable "ident" {
  type        = string
  description = "RDS instance identifier"
}

variable "username" {
  type        = string
  description = "Username"
}

variable "password" {
  type        = string
  description = "Username password"
}



variable "allocated_storage" {
  type        = number
  description = "Data Base allocated storage"
  default     = 20
}

variable "instance_class" {
  type        = string
  description = "RDS class"
  default     = "db.t3.micro"
}

variable "port" {
  type        = number
  description = "RDS port"
  default     = 3306
}




variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs for RDS"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for DB subnet group"
}


variable "tags"  {
  type = map(string)
}




