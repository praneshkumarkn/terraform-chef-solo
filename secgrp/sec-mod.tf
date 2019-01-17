resource "aws_security_group" "demosg" {
  name        = "Demo_securitygroup"
  description = "Allow only specific ports"
  vpc_id      = "${var.vpc_id}"
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
        ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
        ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
        ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "${format("SG-%s-%s", upper(var.Service), upper(var.owner))}"
    owner = "${var.owner}"
    Service = "${var.Service}"
}
  }
