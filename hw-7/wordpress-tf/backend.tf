terraform {
  backend "s3" {
    bucket = "terraform-session-hw-7-nurik"
    key    = "wordpress/terraform.tfstate"
    region = "us-east-1"
  }
}