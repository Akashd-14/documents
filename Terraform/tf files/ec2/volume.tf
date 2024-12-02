resource "aws_ebs_volume" "ebs-1" {
  availability_zone = "us-east-1b"
  size              = 30

  tags = {
    Name = "pub-volume"
  }
}
resource "aws_volume_attachment" "ebs_att-1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs-1.id
  instance_id = aws_instance.terraform-ec2.id
}
resource "aws_ebs_volume" "ebs-2" {
  availability_zone = "us-east-1a"
  size              = 20

  tags = {
    Name = "pvt-volume"
  }
}
resource "aws_volume_attachment" "ebs_att-2" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs-2.id
  instance_id = aws_instance.terraform-pvt-ec2.id
}