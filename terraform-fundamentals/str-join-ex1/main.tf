# Simple example on how to joint string from vars.tf or variable block
# We will create a simple s3 bucket and show how to join string in 3 different ways

resource "aws_s3_bucket" "s3-bucket-1" {
    bucket = "jahid-s3-${var.aws_project}"
    acl = "private"

    tags = { 
       name = "jahid-s3-${var.aws_project}" 
    }
} 


resource "aws_s3_bucket" "s3-bucket-2" {
    bucket = "${local.aws_name}"
    acl = "private"

    tags = { 
       name = "jahid-s3-${var.aws_project}" 
    }
} 





resource "aws_s3_bucket" "s3-bucket-3" {
    bucket = "${local.resource_name}"
    acl = "private"

    tags = { 
       name = "jahid-s3-${var.aws_project}" 
    }
} 

variable "aws_project" {
  type = string
  default = "terraform-fundamental"
}


variable "bucket_name" {
    type = string
    default = "jahid-aws-s3"
}

locals {
    aws_name = "${var.bucket_name}-${var.aws_project}"
    resource_name = join("-", [var.bucket_name, var.aws_project])
}

# delimiter type = ["-", "_", " ," ] or use a empty ""
# we can join simple string directly using interpolation sybtax
# or use terraform "join" function in a local expression as above