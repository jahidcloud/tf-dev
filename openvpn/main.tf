




resource "aws_instance" "open-vpn-box" {
  ami                    = data.aws_ami.jahidami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.jahidkey.key_name
  subnet_id              = aws_subnet.public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.allow-jahid.id]
 

  tags = {
    Name = "VPN-instance"
  }
}

output "instance_ip_addr2" {
  value = aws_instance.open-vpn-box.public_ip
}




# KEY PAIRS
resource "aws_key_pair" "jahidkey" {
  key_name   = "jahidkey1"
  public_key = (file("~/.ssh/id_rsa.pub"))
}



#########

#
## KEY PAIRS
#resource "aws_key_pair" "jahidkey2" {
#  key_name   = "jahidkey2"
#  public_key = (file("~/.ssh/id_rsa.pub"))
#}
#
########
#
#
#
#
#
#
#resource "aws_instance" "ubuntu-box" {
#  ami                    = "ami-06861e497d0ddd508"
#  instance_type          = "t2.micro"
#  key_name               = aws_key_pair.jahidkey2.key_name
#  subnet_id              = aws_subnet.public-subnet-1.id
#  vpc_security_group_ids = [aws_security_group.allow-jahid.id]
# 
#
#  tags = {
#    Name = "test-instance"
#  }
#}
#
#output "instance_ip_addr2" {
#  value = aws_instance.ubuntu-box.public_ip
#}