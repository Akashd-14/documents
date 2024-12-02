terraform {
  backend "s3" {
    bucket = "terraform-backup-bct"
    key    = "vpc-ec2/terraform.tfstate"
    region = "us-east-1"
  }
}