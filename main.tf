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
#resource "aws_s3_bucket" "b" {
 # bucket = "my-tf-testtredev-bucket"
  #versioning {
   #   enabled = true
   #}
#}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-tf-s3219-${var.env}-bucket"
  versioning {
      enabled = true
   }
}
