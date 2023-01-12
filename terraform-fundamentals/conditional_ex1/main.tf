variable "eip_create" {
    description = "create eip if set to true"
}


resource "aws_eip" "web-eip" {
    count = "${var.eip_create == true ? 1 :0 }"
}
# comparing var.eip to boolean "true"
# if var == true, print (x)
# if var.eip_create is true, then the value is 1, else value is zero 

