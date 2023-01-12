


resource "aws_route53_zone" "nginx-dns-zone" {
    name = "aws-lab.net"

    tags = {
        Environment = "sandbox"
    }
}

resource "aws_route53_record" "nginx_record" {
    zone_id     = aws_route53_zone.nginx-dns-zone.zone_id
    name        = "jahid.aws-lab.net"
    type        = "CNAME"
    ttl         = "60"
    records      = ["${aws_lb.nginx-alb.dns_name}"]

    #alias {
    #    name                    = "${aws_lb.nginx-alb.dns_name}"
    #    zone_id                 =  "${aws_lb.nginx-alb.zone_id}"
    #    evaluate_target_health  = true
    #}
    
}