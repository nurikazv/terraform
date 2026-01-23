terraform { 
    backend "s3" { 
        bucket = "terraform-session-backend-bucket-nurik"
        key =  "session-3/terraform.tfstate" 
        region = "us-west-2"
        encrypt = true
    }
}