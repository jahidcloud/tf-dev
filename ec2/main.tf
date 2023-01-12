provider "aws" {
  version = "2.12.0"
  region  = "eu-west-1"
}

terraform {
  required_version = ">= 0.12"
}


data "aws_ami" "jahidami" {
  most_recent = true


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


resource "aws_key_pair" "jahidkey" {
  key_name   = "jahidkey1"
  public_key = (file("~/.ssh/id_rsa.pub"))
}

#resource "aws_instance" "jahidbox" {
#    ami = data.aws_ami.jahidami.id
#    instance_type = "t2.micro"
#    key_name = aws_key_pair.jahidkey.key_name
#    subnet_id = aws_subnet.main-public-1.id
#    vpc_security_group_ids = [aws_security_group.allow-jahid.id]
#
#
#    tags = {
#    Name = "MyVPC"
#  }
#}
#
#output "instance_ip_addr" {
#  value = aws_instance.jahidbox.public_ip
#}


################
### Security group ########

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


####################
#resource "aws_ebs_volume" "ebs-volume-1" {
#  availability_zone = "eu-west-1a"
#  size              = 20
#  type              = "gp2"
#  tags = {
#    Name = "extra volume data"
#  }
#}

#resource "aws_volume_attachment" "ebs-volume-1-attachment" {
#  device_name = "/dev/xvdh"
#  volume_id   = aws_ebs_volume.ebs-volume-1.id
#  instance_id = aws_instance.jahidbox.id
#}



####################

# Another ec2 

resource "aws_instance" "jahidbox2" {
  ami                    = data.aws_ami.jahidami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.jahidkey.key_name
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-jahid.id]
  # user data
  user_data = data.template_cloudinit_config.cloudinit-example.rendered


  tags = {
    Name = "MyVPC"
  }
}

output "instance_ip_addr2" {
  value = aws_instance.jahidbox2.public_ip
}

#resource "aws_ebs_volume" "ebs-volume-2" {
#  availability_zone = "eu-west-1a"
#  size              = 20
#  type              = "gp2"
#  tags = {
#    Name = "extra volume data"
#  }
#}


#resource "aws_volume_attachment" "ebs-volume-2-attachment" {
#  device_name = "/dev/xvdh"
#  volume_id   = aws_ebs_volume.ebs-volume-2.id
#  instance_id = aws_instance.jahidbox2.id
#}