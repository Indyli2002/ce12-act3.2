provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "indyli-ce12-tfstate-12345" # Change this
    key    = "ce12-act3.2-terraform.tfstate"  # Change this
    region = "ap-southeast-1"
  }
}

resource "aws_s3_bucket" "s3_tf" {
  bucket_prefix = "indy-demo-bucket-"

}