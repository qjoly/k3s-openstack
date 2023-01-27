resource "openstack_compute_instance_v2" "instance" {
  name            = "${var.instance_name}"
  image_id        = "${var.image_id}"
  flavor_name     = "${var.flavor_name}"
  key_pair        = "admin"
  security_groups = ["default", "allow_ssh_ping", "kubernetes"]

  network {
    name = "${var.external_net}"
    access_network = false
  }
  network {
    name = "${var.internal_net}"
  }

  connection {
    user        = "ubuntu"
    host        = "${self.network.0.fixed_ip_v4}"
    private_key = "${file("../privkey")}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo terraform executed ",
    ]
  }

}

