resource "aws_s3_bucket" "tf-bucket" {
  bucket = var.bucket-name
  force_destroy = var.force_destroy
  object_lock_enabled = var.obj-lock
  

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
