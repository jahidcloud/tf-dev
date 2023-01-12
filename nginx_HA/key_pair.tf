resource "aws_key_pair" "jahidkey" {
  key_name   = "jahidkey1"
  public_key = (file("~/.ssh/id_rsa.pub"))
}