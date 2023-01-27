output "ext_ip" {
  value = "${openstack_compute_instance_v2.instance.network.0.fixed_ip_v4}"
}

output "int_ip" {
  value = "${openstack_compute_instance_v2.instance.network.1.fixed_ip_v4}"
}

output "instance_name" {
  value = "${var.instance_name}"
}

