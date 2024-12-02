output "vpc-name" {
    value =  aws_vpc.akash.tags
}
output "vpc-cidr" {
    value = aws_vpc.akash.cidr_block
}
output "vpc-arn" {
  value = aws_vpc.akash.arn
}
output "public-sb-name" {
  value = aws_subnet.akash-pub-sb.tags
}
output "public-sb-cidr" {
  value = aws_subnet.akash-pub-sb.cidr_block
}
output "private-sb-name" {
  value = aws_subnet.akash-pub-sb.tags
}
output "private-sb-cidr" {
  value = aws_subnet.akash-pvt-sb.cidr_block
}
output "security-grp-name" {
  value = aws_security_group.terraform-sg.tags
}
output "security-grp-arn" {
  value = aws_security_group.terraform-sg.arn
}
output "security-grp-rules" {
    value =  aws_security_group.terraform-sg.ingress
}
output "security-gateway_id-rules" {
  value = aws_security_group.terraform-sg.egress
}
output "ec2-name" {
  value = aws_instance.terraform-ec2.tags
}
output "instance-id" {
value = aws_instance.terraform-ec2.id
}
output "ec2-public-IP4" {
  value = aws_instance.terraform-ec2.public_ip
}