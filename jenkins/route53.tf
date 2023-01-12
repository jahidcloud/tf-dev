#resource "aws_route53_zone" "jenkins-zone" {
#    name = "aws-lab.info."
#
#    tags = {
#        Environment = "sandbox"
#    }
#}

#resource "aws_route53_record" "jenkins_record" {
#    zone_id = aws_route53_zone.jenkins-zone.zone_id
#    name = "jenkins.aws-lab.info."
#    type = "A"
#
#    #alias {
#    #    name                    = "${aws_elb.jenkins_elb.dns_name}"
#    #    zone_id                 =  "${aws_elb.jenkins_elb.zone_id}"
#    #    evaluate_target_health  = true
#    #}
#    
#}
