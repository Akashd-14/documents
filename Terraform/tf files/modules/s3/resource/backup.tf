terraform {
  backend "s3" {
    bucket = "terraform-backup-bct"
    key = "s3/terraform.tfstate"
    region = "us-east-1"
  }
}