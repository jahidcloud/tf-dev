##ELB
#resource "aws_elb" "jenkins_elb" {
#  name                        = "jenkins-elb"
#  instances                   =  [aws_instance.jenkins-box.id]
#  subnets                     =  [aws_subnet.jenkins-public-subnet-1.id]
#  cross_zone_load_balancing   = true
#  security_groups             = [aws_security_group.elb-jenkins-sg.id]
#  internal                    = false
#  
#  listener {
#    instance_port     = 8080
#    instance_protocol = "http"
#    lb_port           = 8080
#    lb_protocol       = "http"
#  }
#
#  health_check {
#    healthy_threshold   = 2
#    unhealthy_threshold = 2
#    timeout             = 3
#    target              = "HTTP:8080/"
#    interval            = 5
#  }
#
#  tags = {
#    Name = "jenkins-box"
#  }
#
#}