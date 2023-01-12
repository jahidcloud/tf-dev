provider "aws" {
  version = "2.12.0"
  region  = "eu-west-1"
}

terraform {
  required_version = ">= 0.12"
}


variable "user_name" {
    type        = list(string)
    default     = ["jahid", "abdul", "shuri"]
}

# for each dont support list therefore we need to convert list data type into sets
# we convert the list using a terraform built in function call toset
# https://www.terraform.io/docs/configuration/functions/toset.html


resource "aws_iam_user" "example" {
    for_each = toset(var.user_name)
    name = each.value
}

output "all_users" {
  value = aws_iam_user.example
}

output "all_arns" {
  value = values(aws_iam_user.example)[*].arn
}

# This output now show map of resource rather then a list of resoruce


#

#That’s more like it! You’re now deleting solely the exact resource you want, without shifting all the other ones around. This is why you should almost always prefer to use for_each instead of count to create multiple copies of a
