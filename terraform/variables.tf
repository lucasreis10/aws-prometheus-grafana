#AWS Region
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

#Ec2 instance
variable "ec2_ami" {
  type    = string
  default = "ami-06eecef118bbf9259" #Region ami: us-east-1
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

#S3 Bucket complement name
variable "s3_name_complement_bucket" {
  type    = string
  default = "banana"
}

#VPC configuration
variable "cidr_block_vpc" {
  type    = string
  default = "172.30.0.0/16"
}

variable "cidr_block_subnet_public_a" {
  type    = string
  default = "172.30.0.0/24"
}

variable "availability_zone_subnet_public_a" {
  type    = string
  default = "us-east-1a"
}

variable "cidr_aws_route_table_public_route" {
  type    = string
  default = "0.0.0.0/0"
}