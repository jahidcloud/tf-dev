resource "aws_instance" "nginx-pub-1" {
  ami                             = data.aws_ami.nginx_ami.id
  instance_type                   = "t2.micro"
  associate_public_ip_address     = true
  key_name                        = aws_key_pair.jahidkey.key_name
  #subnet_id                       = aws_subnet.nginx-public-subnet-1.id
  vpc_security_group_ids          = [aws_security_group.nginx-ssh-sg.id]

    tags = {
    Name = "nginx-public"
  }
}




output "nginx_ip" {
    value = aws_instance.nginx-pub-1.public_ip
}





output "web_public_dns" {
  value = aws_instance.nginx-pub-1.public_dns
}