#create target group
resource "aws_lb_target_group" "alb-target-group" {
    health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2

    }

  name        = "alb-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.nginx-vpc.id
}


# attachment nginx-01 to alb-target-group
resource "aws_lb_target_group_attachment" "alb-target-group-attachment1" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.nginx-pub-1.id
  port             = 80
}


# attachment nginx-02 to alb-target-group
resource "aws_lb_target_group_attachment" "alb-target-group-attachment2" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.nginx-pub-2.id
  port             = 80
}

#Create ALB

resource "aws_lb" "nginx-alb" {
    name = "nginx-alb"
    internal = false
    security_groups = [aws_security_group.nginx-alb-sg.id]
    subnets = [
       aws_subnet.nginx-public-subnet-1.id,
       aws_subnet.nginx-public-subnet-2.id
    ]
    ip_address_type = "ipv4"
    load_balancer_type = "application"

    tags = {
        Name = "nginx-alb"
    }

}


#add HTTP - 80  listener to ALB

resource "aws_lb_listener" "alb-terraform-listner" {
    load_balancer_arn   = aws_lb.nginx-alb.arn
    port                = 80
    protocol            = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.alb-target-group.arn

    }
             
}