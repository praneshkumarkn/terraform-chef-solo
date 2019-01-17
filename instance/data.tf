data "aws_subnet" "demo" {
  filter {
    name   = "tag:Name"
    values = ["${var.sub_tag}"] # insert value here
  }
}

data "aws_security_group" "demo" {
  filter {
    name   = "tag:Name"
    values = ["${var.sec_tag}"] # insert value here
  }
}
