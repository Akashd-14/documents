resource "aws_instance" "terraform-ec2" {
  ami                    = "ami-012967cc5a8c9f891"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  subnet_id              = aws_subnet.akash-pub-sb.id
  key_name = "terraform-key"
  user_data = ""

  tags = {
    Name = "akash-ec2"
  }
}
