terraform {
  required_version = "~> 1.14.0" // Terraform Version
  required_providers {   // Provider Version 
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28.0"
    }
  }
}