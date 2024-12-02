resource "aws_key_pair" "terrafom_key_pair" {
  key_name   = "terraform-key"
public_key = file("/home/ubuntu/terraform/.ssh/id_rsa.pub")
}