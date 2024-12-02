module "S3-bucket-creation" {
  source = "../module/S3"
  bucket-name = var.s3-bucket-name
  force_destroy = var.force_destroy
  obj-lock = var.obj-lock
  }