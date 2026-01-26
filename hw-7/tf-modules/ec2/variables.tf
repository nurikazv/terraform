variable "name" {
  type = string
  default = ""
}

variable "env" {
  type = string
  default = ""
}



variable "instance_type" {
  type = string
    default = ""

}

variable "subnet_id" {
  type = string
    default = ""

}

variable "vpc_security_group_ids" {
  type = list(string)
  default = []
}

variable "user_data" {
  type = string
    default = ""

}

variable "key_name" {
  type = string
    default = ""

}

variable "associate_public_ip" {
  type    = bool
  default = true
}