resource "aws_vpc" "akash" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tf-vpc"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.akash.id

  tags = {
    Name = "my-ing"
  }
}
resource "aws_subnet" "akash-sb" {
  vpc_id     = aws_vpc.akash.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-subnet"
  }
}
resource "aws_security_group" "my-akash-sg" {
  name        = "akash-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.akash.id

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_route_table" "test" {
  vpc_id = aws_vpc.akash.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
resource "aws_route_table_association" "subnet" {
  subnet_id      = aws_subnet.akash-sb.id
  route_table_id = aws_route_table.test.id
}
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.my-akash-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.my-akash-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.my-akash-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "all-traffic" {
  security_group_id = aws_security_group.my-akash-sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = "0"
  ip_protocol = "-1"  ##For all traffic
  to_port = "0"
}
resource "aws_ebs_volume" "ebs" {
  availability_zone = "us-east-1b"
  size              = 30

  tags = {
    Name = "my-volume"
  }
}
#resource "aws_key_pair" "akash" {
#  key_name = "akash-key"
#  public_key = 
#}
resource "aws_instance" "akash" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t2.medium"
  availability_zone = "us-east-1b"
  vpc_security_group_ids = ["aws_security_group.my-akash-sg.id"]
  security_groups = ["aws_security_group.my-akash-sg.id"]
 # key_name = "akash-key"
    tags = {
    Name = "akash"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.akash.id
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}
provider "aws" {
  region     = "us-east-1"
  }