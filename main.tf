terraform {
  backend "s3" {
    bucket = "praneshs3"
    key = "backend/terraform.tfstate"
    access_key = "AKIAJRJ4HHV6VUWNHJ7Q"
    secret_key = "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"
    region     = "us-east-1"
 }
}


provider "aws" {
  region     = "${var.region}"
   access_key = "AKIAJRJ4HHV6VUWNHJ7Q"
   secret_key = "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"

}
  
# Module to create Subnet,Route_table
module "network" {
source = "./network"
vpc_cidr = "${var.vpc_cidr}"
Service = "${var.Service}"
owner = "${var.owner}"
az = "${var.az}"
subnet_cidr = "${var.subnet_cidr}"
}

# Module to create Security Group
module "secgrp" {
source = "./secgrp"
vpc_id = "${module.network.vpc-out}"
Service = "${var.Service}"
owner = "${var.owner}"
}

# Module to create Instance
module "instance" {
source = "./instance"
keyname = "${var.keyname}"
ami_id = "${var.ami_id}"
SecGroupId = "${module.secgrp.secgrp-out}"
subnetId = "${module.network.sub-out}"
Service = "${var.Service}"
owner = "${var.owner}"

}
