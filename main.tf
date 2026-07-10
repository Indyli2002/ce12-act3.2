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
    bucket = "indy-ce12-tfstate-12345"
    key    = "ce12-act3.2-terraform.tfstate"
    region = "ap-southeast-1"
  }
}

#checkov:skip=CKV_AWS_18:Access logging not needed for lab
#checkov:skip=CKV_AWS_144:Cross-region replication not needed for lab
#checkov:skip=CKV_AWS_145:KMS encryption not needed for lab
#checkov:skip=CKV2_AWS_62:Event notifications not needed for lab
#checkov:skip=CKV2_AWS_6:Public access block not needed for lab
#checkov:skip=CKV2_AWS_61:Lifecycle config not needed for lab
#checkov:skip=CKV_AWS_21:Versioning not needed for lab
resource "aws_s3_bucket" "s3_tf" {
  bucket_prefix = "indy-demo-bucket-"

  tags = {
    Name = "CE12 Bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_tf.id

  versioning_configuration {
    status = "Enabled"
  }
}