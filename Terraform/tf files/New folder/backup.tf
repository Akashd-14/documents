terraform {
  backend "s3" {
    bucket = "terraform-backup-bct"
    key    = "count/index/terraform.tfstate"
    region = "us-east-1"
  }
}