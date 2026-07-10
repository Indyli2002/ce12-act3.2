provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "indy-ce12-tfstate-12345"       # Change this
    key    = "ce12-act3.2_terraform.tfstate" # Change this
    region = "ap-southeast-1"
  }
}

# checkov suppressions
# checkov:skip=CKV_AWS_18
# checkov:skip=CKV_AWS_144
# checkov:skip=CKV_AWS_145
# checkov:skip=CKV2_AWS_62
# checkov:skip=CKV2_AWS_6
# checkov:skip=CKV2_AWS_61
# checkov:skip=CKV_AWS_21

resource "aws_s3_bucket" "s3_tf" {
  bucket_prefix = "indy-demo-bucket-"

  tags = {
    Name = "CE12 Bucket"
  }
}

