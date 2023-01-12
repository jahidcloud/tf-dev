# Creating simple rolw

resource "aws_iam_role" "s3-role" {
  name = "s3-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "s3-bucket-role-instanceprofile" {
  name = "s3-mybucket-role"
  role = aws_iam_role.s3-role.id
}







resource "aws_iam_role_policy" "s3-mybucket-role-policy" {
  name = "s3-mybucket-role-policy"
  role = aws_iam_role.s3-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::jahid-bucket-01",
              "arn:aws:s3:::jahid-bucket-01/*"
            ]
        }
    ]
}
EOF

}
















