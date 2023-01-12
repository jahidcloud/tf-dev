resource "aws_s3_bucket" "jahid-bucket" {
    bucket = var.bucket_name
    acl = "private"

}



resource "aws_iam_role" "role" {
  name = var.role_name
  # for some odd reason this "assume_role_policy has to be added"
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

}



resource "aws_iam_role_policy_attachment" "role-attach" {
  role = aws_iam_role.role.name
  policy_arn = aws_iam_policy.s3_list_all.arn
}


resource "aws_iam_policy" "s3_list_all" {
  name        = "s3_list_all"
  description = "allows listing all s3 buckets"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:Put*"
        ],
        "Resource": [
            "arn:aws:s3:::jahid-bucket-01",
            "arn:aws:s3:::jahid-bucket-01/*"
        ]
        },
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "*"
        }
    ]
}
EOF
}



## creating an aws policy that allows user assume this role 
#resource "aws_iam_policy" "prod_s3" {
#  name        = "prod_s3"
#  description = "allow assuming prod_s3 role"
#  policy = jsonencode({
#    Version = "2012-10-17",
#    Statement = [
#      {
#        Effect   = "Allow",
#        Action   = "sts:AssumeRole",
#        Resource = "arn:aws:sts::874966447508:assumed-role/Jahmed21"
#    }]
#  })
#}