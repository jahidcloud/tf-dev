# To create an autoscaling, you need to create launch configuraton


resource "aws_launch_configuration" "example-launchconfig" {
    name_prefix = "example-launchconfig"
    image_id    = data.aws_ami.jahidami.id
    key_name    = aws_key_pair.jahidkey.key_name
    instance_type   = "t2.micro"
    security_groups = [aws_security_group.allow-jahid.id]
}

resource "aws_autoscaling_group" "example-autoscaling" {
    name                        = "example-autoscaling"
    vpc_zone_identifier         = [aws_subnet.main-public-1.id]
    launch_configuration        = aws_launch_configuration.example-launchconfig.name
    min_size                    = 1
    max_size                    = 2
    health_check_grace_period   = 300
    health_check_type           = "EC2"
    force_delete                = true

    tag {
      key = "Jahid"
      value = "Ec2 instance"
      propagate_at_launch = true 
    }

}