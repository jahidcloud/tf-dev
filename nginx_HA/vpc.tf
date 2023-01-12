# Internet VPC

resource "aws_vpc" "nginx-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "nginx-vpc"
  }

}


# Subnet

resource "aws_subnet" "nginx-public-subnet-1" {
  vpc_id                  = aws_vpc.nginx-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "nginx-public-subnet-1"
  }
}

resource "aws_subnet" "nginx-public-subnet-2" {
  vpc_id                  = aws_vpc.nginx-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "nginx-public-subnet-2"
  }
}


# Internet GW
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.nginx-vpc.id

  tags = {
    Name = "main"
  }
}

# route tables
resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.nginx-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = "main-public-1"
  }
}


resource "aws_route_table" "route-public-2" {
  vpc_id = aws_vpc.nginx-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = "main-public-1"
  }
}




# route associations public
resource "aws_route_table_association" "main-public-1" {
  subnet_id      = aws_subnet.nginx-public-subnet-1.id
  route_table_id = aws_route_table.route-public.id
}


# route associations public
resource "aws_route_table_association" "main-public-2" {
  subnet_id      = aws_subnet.nginx-public-subnet-2.id
  route_table_id = aws_route_table.route-public-2.id
}
