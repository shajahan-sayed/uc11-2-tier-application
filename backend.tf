terraform {
   backend "s3" {
       bucket = "two_tier_backend"
       key = "terraform.tfstate"
       dynamodb_table = "two_tier_backend"
       region = "ap-southeast-2"
    }
}

       
