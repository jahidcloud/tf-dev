# simple s3 bucket module bucket example

resource "aws_s3_bucket" "test-bucket" {
    bucket = var.name
    acl = "private"

    versioning {
    enabled     = var.versioning 
    }
    count = var.enable_sse  ? 1 : 0
   

}