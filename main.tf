terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "3.23.0"
   }
}

}

provider "aws" {
    region = "us-east-1"

}
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-testtredev-bucket"
  versioning {
      enabled = true
   }
}


