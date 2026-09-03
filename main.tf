terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.7.0"
    }
    }
    required_version = "~>1.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-new-S3-bucket"
  tags = {
    Name = "my-bucket-prod"
    Environment = var.Environment
    }
}

variable "Environment" {
  default = "Dev"
}

output "Environment_name" {
  value = aws_s3_bucket.bucket.id
}