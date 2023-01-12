




resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.jahidami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.jahidkey.key_name
  subnet_id              = aws_subnet.public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.allow-jahid.id]
 

  tags = {
    Name = "Bastion instance"
  }
}


resource "aws_instance" "private-instance" {
  ami                    = data.aws_ami.jahidami.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private-subnet-1.id
  vpc_security_group_ids = [aws_security_group.private-instance.id]
  key_name               = aws_key_pair.jahidkey.key_name
 

  tags = {
    Name = "private instance"
  }
}


output "bastion_ip" {
    value = aws_instance.bastion.public_ip
}


# KEY PAIRS
resource "aws_key_pair" "jahidkey" {
  key_name   = "jahidkey1"
  public_key = (file("~/.ssh/id_rsa.pub"))
}



