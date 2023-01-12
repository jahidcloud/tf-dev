# Security Group

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
    cidr_blocks = ["82.27.3.77/32"]
  }
  tags = {
    Name = "allow-ssh"
  }

}



resource "aws_security_group" "private-instance" {
  name        = "allow-private"
  vpc_id = aws_vpc.vpc-main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "private-instance" {
 from_port                = 22
 protocol                 = "tcp"
 security_group_id        = aws_security_group.private-instance.id
 source_security_group_id = aws_security_group.allow-jahid.id
 to_port                  = 22
 type                     = "ingress"

 }
 