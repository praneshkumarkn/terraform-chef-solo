variable "vpc_id" {
 description = "Existing VPC ID"
  default = "vpc-c411c0be"
}

variable "access_key" {
default = "AKIAIAK2EKHJWDALVP7Q"
}

variable "secret_key" {
default = "9ynU17/4ZWm2NyYlN5hncW8Qbjijq1j5h9of9F8b"
}

variable "region" {
default = "us-east-1"
description = "AWS Region "
}

variable "az" {
default = "us-east-1a"
description = "Availability Zone"
}

variable "aws_internet_gateway" {
default = "igw-955b5fed"
description = "Existing Internet Gateway"
}

variable "subnet_cidr" {
default = "10.0.1.0/24"
description = "Subnet Cidr Block"
}

variable "secg" {
type = ""
default = "sg-ac5f6fe1"
}

variable "sub" {
default = "subnet-4a65e02d"
}

variable "keyname"{
description = "Existing Key Name"
  default = "newkey"
  }

variable "ami_id"{
description = "Ami_ID for instance creation"
default = "ami-05a36d3b9aa4a17ac"
  }

variable "Service" {
default = "APP"
}


variable "owner" {
default = "CAT" 
}


variable "vpc_cidr" {
default = "10.0.0.0/16"
}

