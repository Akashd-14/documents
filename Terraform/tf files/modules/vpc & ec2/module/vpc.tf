## VPC ##
resource "aws_vpc" "akash" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc-name
  }
}
## IGW ##
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.akash.id

  tags = {
    Name = var.internet-gw
  }
}
## PUBLIC SUBNET ##
resource "aws_subnet" "akash-pub-sb" {
  vpc_id                  = aws_vpc.akash.id
  cidr_block              = var.pub-sb-cidr
  map_public_ip_on_launch = true
  availability_zone       = var.pub-az

  tags = {
    Name = var.public-subnet
  }
}
## PRIVATE SUBNET ###
resource "aws_subnet" "akash-pvt-sb" {
  vpc_id            = aws_vpc.akash.id
  cidr_block        = var.pvt-sb-cidr
  availability_zone = var.pvt-az
  tags = {
    Name = var.private-subnet
  }
}
## PUBLIC ROUTE TABLE ###
resource "aws_route_table" "akash-pub-rt" {
  vpc_id = aws_vpc.akash.id

  route {
    cidr_block = var.default-cidr
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
  domain     = "vpc"
  depends_on = [aws_internet_gateway.gw]
}
### NAT GATEWAY ###
resource "aws_nat_gateway" "akash-nat-gw" {
  allocation_id = aws_eip.akash-eip.id
  subnet_id     = aws_subnet.akash-pub-sb.id
  depends_on    = [aws_internet_gateway.gw]
  tags = {
    Name = var.nat-gw
  }
}
## PRIVATE ROUTE TABLE ##
resource "aws_route_table" "akash-pvt-rt" {
  vpc_id = aws_vpc.akash.id
  route {
    cidr_block = var.default-cidr
    gateway_id = aws_nat_gateway.akash-nat-gw.id
  }
}
### PRIVATE ROUTE TABLE ASSOCIATION ##
resource "aws_route_table_association" "my-pvt-subnet" {
  subnet_id      = aws_subnet.akash-pvt-sb.id
  route_table_id = aws_route_table.akash-pvt-rt.id
}