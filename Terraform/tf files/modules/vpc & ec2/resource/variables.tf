variable "vpc-name" {
  type = string
}
variable "vpc-cidr" {
  type = string
}
variable "default-cidr-range" {
  type = string

}
variable "internet-gw-name" {
  type = string
}
variable "nat-gw-name" {
  type = string

}
variable "pub-availability_zone" {
  type = string
}
variable "pvt-availability_zone" {
  type = string
}
variable "pub-sub-name" {
  type = string
}
variable "pvt-sub-name" {
  type = string
}
variable "pub-sb-cidr-range" {
  type = string
}
variable "pvt-sb-cidr-range" {
  type = string
}
variable "custom-sg-name" {
  type = string
}
variable "ec2-name" {
  type = string

}
variable "instance_type" {
  type = string
}
variable "machine-id" {
  type = string

}
variable "key-pair-name" {
  type = string
}