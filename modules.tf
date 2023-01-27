module "kubemaster" {
    count = 1
    source = "./modules/instance"
    depends_on = [openstack_networking_subnet_v2.kubenet]
    instance_name = "master-${count.index}"
    image_id = "${var.image_id}"
}

module "kubenode" {
    count = 1
    source = "./modules/instance"
    depends_on = [openstack_networking_subnet_v2.kubenet]
    instance_name = "node-${count.index}"
    image_id = "${var.image_id}"
}


