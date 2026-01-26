variable "db_username" {
  type    = string
  default = "wpuser"
}

variable "db_password" {
  type      = string
  sensitive = true
}