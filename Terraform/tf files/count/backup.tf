terraform {
  backend "s3" {
    bucket = "terraform-backup-bct"
    key    = "count/terraform.tfstate"
    region = "us-east-1"
  }
}