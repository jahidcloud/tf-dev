provider "aws" {
  version = "2.12.0"
  region  = "eu-west-1"
}

terraform {
  required_version = ">= 0.12"
}


## Simple example of using count meta parameter to keep code dry


#resource "aws_iam_user" "hive-dev" {
#    count = 3 
#    name = "user.${count.index}" # having hive-dev.1 or hive-dev.2 is not readable
#}

#resource "aws_iam_user" "user" { wrong way to use count since every user will have the sname 
#    count = 3                    this will generate an error 
#    name = neo
#}


variable "user_name" {
    type        = list(string)
    default     = ["jahid", "abdul", "shuri"]
}

#resource "aws_iam_user" "cloud-dev" {  # this is also wrong as it create user 3 with the same name cause 
#    count = 3                                        #you specified one index from the list not all 3 
#    name = var.user_name[1]
#}

# we can use length function which is eqvalent of python len function which output number of elements in a variable

resource "aws_iam_user" "aws-op" {
    count = length(var.user_name)
    name = var.user_name[count.index] # now combined with length function, we are using index function part of count paerameter
}                                     # to indext particular name which are element in string to name iam_user  

output "user_arn" {
    value = aws_iam_user.aws-op[0].arn # using output to give us "ONE" user name arn data and to perform this we use index notation 
}


output "all_user_arn" {
    value = aws_iam_user.aws-op[*].arn  # If you want the ARNs of all the IAM users, you need to use a splat expression, "*", instead of the index
}



# jahid = 0
# abdul = 1
# shuri = 2


