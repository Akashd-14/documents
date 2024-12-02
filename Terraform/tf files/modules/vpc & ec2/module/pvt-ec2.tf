resource "aws_instance" "pvt-ec2" {
  ami                    = var.AMI-id
  instance_type          = var.instance_type
  availability_zone      = var.pvt-az
  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  subnet_id              = aws_subnet.akash-pvt-sb.id
  key_name               = var.key-pair


  tags = {
    Name = "pvt2-ec2"
  }
}