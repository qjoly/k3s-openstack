
resource "openstack_networking_network_v2" "kubenet" {
  name           = "${var.internal_net}"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "kubenet" {
  name       = "subnet_1"
  network_id = "${openstack_networking_network_v2.kubenet.id}"
  cidr       = "${var.net_cidr}"
  ip_version = 4
  
  depends_on = [openstack_networking_network_v2.kubenet]
}




