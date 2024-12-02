variable "bucket-name" {
  type = string
  description = "AWS S3 Bucket Name"
}
variable "force_destroy" {
    type = bool
}
variable "obj-lock" {
    type = bool
}
