data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "terraform-session-backend-bucket-nurik"
    key =  "hw-4/terraform.tfstate" 
    region = "us-west-2"
  }
}

