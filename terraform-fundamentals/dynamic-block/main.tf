resource "aws_security_group" "main" {
    name = "jahid-sg"
    vpc_id = data.aws_vpc.main.id

    dynamic "ingress" {
        for each = local.ingress_rules
    
        content {
            description     = ingress.value.description
            from_port       = ingress.value.port
            to_port         = ingress.value.port
            protocol        = ingress.value.port
             cidr_blocks    = ["0.0.0.0/0"]
        }
    
    
    }


//    ingress {
//        description     = "Port 443"
//        from_port       = 443
//        to_port         = 443
//        protocol        = "tcp"  
//        cidr_blocks = ["0.0.0.0/0"]
//    }
//
//    ingress {
//        description     = "Port 80"
//        from_port       = 80
//        to_port         = 80
//        protocol        = "tcp"  
//        cidr_blocks = ["0.0.0.0/0"]
//    }
//


}

# defined one ingress block, what if i want to define another port like 80, or 22 or 52 ?
# This mean for each port i want to add, i have to add ingress blocl again and again

# Use a dynamic block, dynamically call the ingress multiple time. 



local { 
    ingress_rules = [{
        port            = 443
        description     = "Port 443"
    },
    {
        port            = 80
        description     = "Port 80"
    }]
}


// https://stackoverflow.com/questions/56442607/what-is-the-iterator-feature-for-in-terraforms-for-each
// https://stackoverflow.com/questions/57503110/how-can-i-iterate-through-a-map-variable-in-terraform