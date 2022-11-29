terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "3.23.0"
   }
}

}

provider "aws" {
    region = var.aws_region

}
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-testtredev-bucket"
  versioning {
      enabled = true
   }
}


