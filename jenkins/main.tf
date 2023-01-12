




resource "aws_instance" "jenkins-box" {
  ami                    = data.aws_ami.jahidami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.jahidkey.key_name
  subnet_id              = aws_subnet.jenkins-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.allow-jenkins.id]
 

  tags = {
    Name = "jenkins-box"
  }

 provisioner "local-exec" {
    command = <<EOF
aws ec2 wait instance-status-ok --region eu-west-1 --instance-ids ${self.id}
ansible-playbook --extra-vars 'passed_in_hosts=tag_Name_${self.tags.Name}' ansible_templates/jenkins-master-sample.yml
EOF

  } 

}


output "instance_ip_addr2" {
  value = aws_instance.jenkins-box.public_ip
}




# KEY PAIRS
resource "aws_key_pair" "jahidkey" {
  key_name   = "jahidkey1"
  public_key = (file("~/.ssh/id_rsa.pub"))
}

#################

