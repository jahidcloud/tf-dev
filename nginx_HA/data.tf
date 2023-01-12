data "aws_ami" "nginx_ami" {
    most_recent = true
     owners     = ["self"]

    filter{
        name = "tag:Name"

        values = [
            "nginx-application*"
        ]
    }
}