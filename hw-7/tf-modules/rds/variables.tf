variable "identifier" {
  type        = string
  description = "RDS instance identifier"
}

variable "db_name" {
  type        = string
  description = "Initial database name"
}

variable "username" {
  type        = string
  description = "Database username"
}

variable "password" {
  type        = string
  description = "Database password"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage size"
  default     = 20
}

variable "instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "port" {
  type        = number
  description = "Database port"
  default     = 3306
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for DB subnet group"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs for RDS"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
}

variable "master_key" {
  type        = bool
  description = "Enable storage encryption"
  default     = true
}

variable "master_key_id" {
  type        = string
  description = "KMS key ID for encryption"
  default     = ""
}
