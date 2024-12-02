output "bucket-name" {
  value = aws_s3_bucket.tf-bucket.bucket_domain_name
}
output "bucket-arn" {
    value = aws_s3_bucket.tf-bucket.arn
  
}
output "tag" {
value = aws_s3_bucket.tf-bucket.tags
  
}
