provider "aws" {
    region = "us-west-2"

        default_tags {
        tags = {
            Enviroment = "dev"
            Project_name = "hw-4"
            Team = "Nurik"
            Managed_by = "terraform"
        }
    }
}