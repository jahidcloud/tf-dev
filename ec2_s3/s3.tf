resource "aws_s3_bucket" "s3-bucket" {
    bucket = "jahid-bucket-01"
    acl = "private"

    tags = {
        Name = "jahid-bucket-01"
    }

}
