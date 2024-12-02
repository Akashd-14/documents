variable "vpc-name" {
  type        = string
}
variable "cidr" {
  type        = string
}
variable "default-cidr" {
  type    = string
}
variable "internet-gw" {
  type        = string
}
variable "nat-gw" {
  type        = string

}
variable "pub-az" {
  type    = string
}
variable "pvt-az" {
  type    = string
}
variable "public-subnet" {
  type        = string
}
variable "private-subnet" {
  type        = string
}
variable "pub-sb-cidr" {
  type        = string
}
variable "pvt-sb-cidr" {
  type        = string
}
variable "sg-name" {
  type        = string
}
variable "pub-ec2-name" {
  type        = string

}
variable "instance_type" {
  type        = string
}
variable "AMI-id" {
  type        = string

}
variable "key-pair" {
  type        = string
}