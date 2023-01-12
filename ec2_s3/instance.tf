
resource "aws_instance" "jahidbox2" {
  ami                    = data.aws_ami.jahidami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.jahidkey.key_name
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-jahid.id]
  iam_instance_profile   = aws_iam_instance_profile.s3-bucket-role-instanceprofile.name


  tags = {
    Name = "MyVPC"
  }
}

output "instance_ip_addr2" {
  value = aws_instance.jahidbox2.public_ip
}

output "IAM_role" {
  value = aws_iam_role.s3-role.id
}

output "S3_bucket" {
    value = aws_s3_bucket.s3-bucket.id
}