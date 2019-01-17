resource "aws_vpc" "Demo" {
  cidr_block       = "${var.vpc_cidr}"

  tags = {
    Name = "${format("VPC-%s-%s", upper(var.Service), upper(var.owner))}"
	owner = "${var.owner}"
    Service = "${var.Service}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.Demo.id}"
  tags = {
    Name = "${format("IGW-%s-%s", upper(var.Service), upper(var.owner))}"
	owner = "${var.owner}"
    Service = "${var.Service}"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.Demo.id}"
  cidr_block = "${var.subnet_cidr}"
  availability_zone = "${var.az}"
  tags = {
    Name = "${format("SUB-%s-%s", upper(var.Service), upper(var.owner))}"
    owner = "${var.owner}"
    Service = "${var.Service}"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.Demo.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${format("RT-%s-%s", upper(var.Service), upper(var.owner))}"
        Creator= "Pranesh"
    owner = "${var.owner}"
    Service = "${var.Service}"
  }
}

resource "aws_route_table_association" "public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}
