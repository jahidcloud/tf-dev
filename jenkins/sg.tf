# Security Group

resource "aws_security_group" "allow-jenkins" {
  vpc_id = aws_vpc.jenkins-vpc.id
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
    cidr_blocks = ["82.27.3.77/32"]
  }


    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

   ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow-jenkins"
  }

}










resource "aws_security_group" "elb-jenkins-sg" {
  name        = "elb_jenkins_sg"
  description = "Allow https traffic"
  vpc_id      = aws_vpc.jenkins-vpc.id

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "elb_jenkins_sg"
  }
}




#resource "aws_security_group" "private-instance" {
#  name        = "allow-private"
#  vpc_id = aws_vpc.vpc-main.id
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}
#
#resource "aws_security_group_rule" "private-instance" {
# from_port                = 22
# protocol                 = "tcp"
# security_group_id        = aws_security_group.private-instance.id
# source_security_group_id = aws_security_group.allow-jahid.id
# to_port                  = 22
# type                     = "ingress"
#
# }


