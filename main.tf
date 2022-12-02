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

resource "aws_athena_database" "myathenadb" {
  name   = "athena_database_2122022"
  bucket = aws_s3_bucket.mybucket.bucket
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
