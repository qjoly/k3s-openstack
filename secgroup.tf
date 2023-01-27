resource "openstack_networking_secgroup_v2" "allow_ssh_ping" {
  name        = "allow_ssh_ping"
  description = "My neutron security group"
}

resource "openstack_networking_secgroup_rule_v2" "allow_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.allow_ssh_ping.id}"
}

resource "openstack_networking_secgroup_rule_v2" "allow_ping-in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.allow_ssh_ping.id}"
}

resource "openstack_networking_secgroup_rule_v2" "allow_ping-out" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.allow_ssh_ping.id}"
}

resource "openstack_networking_secgroup_v2" "kubernetes" {
  name        = "kubernetes"
  description = "My neutron security group"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-api-server-in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6443 
  port_range_max    = 6443
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-api-server-out" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6443 
  port_range_max    = 6443
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-etcd-in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2379 
  port_range_max    = 2380
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-etcd-out" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2379 
  port_range_max    = 2380
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-kubelet-api-in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10250
  port_range_max    = 10250 
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-kubelet-api-out" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10250
  port_range_max    = 10250 
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-kubescheduler-in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10259 
  port_range_max    = 10259 
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-kubescheduler-out" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10259 
  port_range_max    = 10259 
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-kube-controller-manager-out" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10257 
  port_range_max    = 10257 
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-kube-controller-manager-in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10257 
  port_range_max    = 10257 
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-nodeport-in" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30000 
  port_range_max    = 32767
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

resource "openstack_networking_secgroup_rule_v2" "kubernetes-nodeport-out" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30000 
  port_range_max    = 32767
  remote_ip_prefix  = "${var.net_cidr}"
  security_group_id = "${openstack_networking_secgroup_v2.kubernetes.id}"
}

