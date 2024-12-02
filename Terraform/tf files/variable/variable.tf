variable "vpc-name" {
  type        = string
  default     = "my-vpc-name"
  description = "vpc name"
}
variable "cidr" {
  type        = string
  default     = "192.180.0.0/16"
  description = "vpc cidr range"
}
variable "default-cidr" {
  type    = string
  default = "0.0.0.0/0"

}
variable "internet-gw" {
  type        = string
  default     = "my-vpc-igw"
  description = "Internet Gateway Name"
}
variable "nat-gw" {
  type        = string
  default     = "my-nat-gw"
  description = "Nat Gateway Name"

}
variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}
variable "public-subnet" {
  type        = string
  default     = "my-pub-subnet"
  description = "Public Subnet Name"
}
variable "private-subnet" {
  type        = string
  default     = "my-pvt-subnet"
  description = "Private Subnet Name"
}
variable "pub-sb-cidr" {
  type        = string
  default     = "192.180.1.0/24"
  description = "Public Subnet CIDR Range"
}
variable "pvt-sb-cidr" {
  type        = string
  default     = "192.180.2.0/24"
  description = "Private Subnet CIDR Range"
}
variable "sg-name" {
  type        = string
  default     = "my-sg"
  description = "My Custom Security Group"
}
variable "ec2-name" {
  type        = string
  default     = "my-tf-ec2"
  description = "EC2 instance name"

}
variable "instance_type" {
  type        = string
  default     = "t2.medium"
  description = "Instance type"
}
variable "AMI-id" {
  type        = string
  default     = "ami-012967cc5a8c9f891"
  description = "Amazon Machine Image ID"

}
variable "key-pair" {
  type        = string
  default     = "new-key"
  description = "AWS EC2 key pair name"
}