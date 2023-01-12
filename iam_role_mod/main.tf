data "aws_iam_policy_document" "example" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}

#resource "aws_iam_policy" "example" {
#  name   = "example_policy"
#  path   = "/"
#  policy = "${data.aws_iam_policy_document.example.json}"
#}



module "aggregated_assume_policy" {
  source           = "git::https://github.com/cloudposse/terraform-aws-iam-policy-document-aggregator.git?ref=tags/0.3.1"
  source_documents = ["${data.aws_iam_policy_document.example.json}"]
}



resource "aws_iam_role" "default" {
  name                 = "jahid-iam-role"
  assume_role_policy   = "${module.aggregated_assume_policy.result_document}"
}






 