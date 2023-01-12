resource "aws_instance" "nginx-pub-1" {
  ami                             = data.aws_ami.nginx_ami.id
  instance_type                   = "t2.micro"
  associate_public_ip_address     = true
  key_name                        = aws_key_pair.jahidkey.key_name
  subnet_id                       = aws_subnet.nginx-public-subnet-1.id
  vpc_security_group_ids          = [aws_security_group.nginx-ssh-sg.id]

    tags = {
    Name = "nginx-public"
  }
}



resource "aws_instance" "nginx-pub-2" {
  ami                             = data.aws_ami.nginx_ami.id
  instance_type                   = "t2.micro"
  associate_public_ip_address     = true
  key_name                        = aws_key_pair.jahidkey.key_name
  subnet_id                       = aws_subnet.nginx-public-subnet-1.id
  vpc_security_group_ids          = [aws_security_group.nginx-ssh-sg.id]

    tags = {
    Name = "nginx-public"
  }
}




output "nginx_ip" {
    value = aws_instance.nginx-pub-1.public_ip
}



output "nginx_ip_2" {
    value = aws_instance.nginx-pub-2.public_ip
}


output "nginx_alb_dns" {
    value = aws_lb.nginx-alb.dns_name
}


output "nginx_alb_zone" {
    value = aws_lb.nginx-alb.zone_id
}

