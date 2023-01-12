variable "owner" {
    type = string
    default = "Jahid.Ahmed"
}

variable "environment" {
    type = string 
    default = "Dev"
}

variable "region" {
    type = string 
    default = "eu-west-1"
}

variable "versioning" {
  type    = bool
  default = false
}

variable "service"{
    type = string
    default = "aws-s3" 
}
