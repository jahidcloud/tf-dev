
resource "aws_instance" "jahidbox2" {
  ami                    = data.aws_ami.jahidami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.jahidkey.key_name
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-jahid.id]


  tags = {
    Name = "MyVPC"
  }
}


resource "aws_key_pair" "jahidkey" {
  key_name   = "jahidkey1"
  public_key = (file("~/.ssh/id_rsa.pub"))
}


resource "aws_security_group" "allow-jahid" {
  vpc_id = aws_vpc.vpc-main.id
  name   = "allow-jahid"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }

}






output "instance_ip_addr2" {
  value = aws_instance.jahidbox2.public_ip
}