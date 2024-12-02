resource "aws_instance" "terraform-ec2" {
  ami                    = var.AMI-id
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  subnet_id              = aws_subnet.akash-pub-sb.id
  key_name               = var.key-pair


  tags = {
    Name = var.ec2-name
  }
}