## VPC ##
resource "aws_vpc" "akash" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tf-vpc"
  }
}
## IGW ##
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.akash.id

  tags = {
    Name = "my-ing"
  }
}
## PUBLIC SUBNET ##
resource "aws_subnet" "akash-pub-sb" {
  vpc_id                  = aws_vpc.akash.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "tf-pub-subnet"
  }
}
## PRIVATE SUBNET ###
resource "aws_subnet" "akash-pvt-sb" {
  vpc_id = aws_vpc.akash.id
  cidr_block ="10.0.2.0/24"
  availability_zone = "us-east-1a" 
  tags = {
    Name = "tf-pvt-sb"
  }
}
## PUBLIC ROUTE TABLE ###
resource "aws_route_table" "akash-pub-rt" {
  vpc_id = aws_vpc.akash.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
### PUBLIC ROUTE TABLE ASSOCIATION ##
resource "aws_route_table_association" "my-pub-subnet" {
  subnet_id      = aws_subnet.akash-pub-sb.id
  route_table_id = aws_route_table.akash-pub-rt.id
}
## ELASTIC IP ##
resource "aws_eip" "akash-eip" {
  domain   = "vpc"
  depends_on = [aws_internet_gateway.gw]
}
### NAT GATEWAY ###
resource "aws_nat_gateway" "akash-nat-gw" {
allocation_id = aws_eip.akash-eip.id
  subnet_id     = aws_subnet.akash-pub-sb.id
depends_on = [ aws_internet_gateway.gw ]
  tags = {
    Name = "my-nat-gw"
  }  
}
## PRIVATE ROUTE TABLE ##
resource "aws_route_table" "akash-pvt-rt" {
vpc_id = aws_vpc.akash.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.akash-nat-gw.id
  }
}
### PRIVATE ROUTE TABLE ASSOCIATION ##
resource "aws_route_table_association" "my-pvt-subnet" {
  subnet_id      = aws_subnet.akash-pvt-sb.id
  route_table_id = aws_route_table.akash-pvt-rt.id
}