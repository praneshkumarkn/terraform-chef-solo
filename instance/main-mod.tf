resource "aws_instance" "Demo1" {
ami = "${var.ami_id}"
instance_type =  "t2.micro"
key_name = "${var.keyname}"
associate_public_ip_address = true
vpc_security_group_ids = ["${data.aws_security_group.demo.id}"]
subnet_id = "${data.aws_subnet.demo.id}"

connection {
    user     = "ubuntu"
    private_key = "${file("./instance/newkey.pem")}"
  }

  provisioner "file" {
    source      = "./instance/cookbooks.tar.gz"
    destination = "/tmp/cookbooks.tar.gz"
  }

  provisioner "file" {
    source = "./instance/node.json"
    destination = "/tmp/node.json"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -LO https://www.chef.io/chef/install.sh && sudo bash ./install.sh",
      "sudo chef-solo --recipe-url /tmp/cookbooks.tar.gz -o recipe[tomcat::default]",
      "sudo chef-solo --recipe-url /tmp/cookbooks.tar.gz -o recipe[apache::default]"

    ]
  }


tags {
Name = "${format("EC2-%s-%s", upper(var.Service), upper(var.owner))}"
	owner = "${var.owner}"
    Service = "${var.Service}"
}
}

