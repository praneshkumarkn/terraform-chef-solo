output "sub-out" {
  value = "${aws_subnet.public-subnet.id}"
}

output "vpc-out" {
  value = "${aws_vpc.Demo.id}"
}
