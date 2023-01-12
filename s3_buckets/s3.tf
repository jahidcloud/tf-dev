#resource "aws_s3_bucket" "jahid-bucket" {
#    bucket = "jahid-bucket"
#    acl = "private"
#
# tags = {
#     #Name = "jahid-bucket-${format("%03d", +1)}"
#     Enivronment = "Dev"
# }
#}




# S3 bucket with versioning enabled as versioning disabled by default

resource "aws_s3_bucket" "test-bucket" {
    bucket = local.bucket_name
    acl = "private"

    versioning {
        enabled = var.versioning
  }
    tags = local.account_tags

}

locals{
    account_tags = {
        service = var.service
        environment  = var.environment

    }
}

locals {
    bucket_name = "${var.service}-${var.environment}-01"
}