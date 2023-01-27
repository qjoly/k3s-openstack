
resource "null_resource" "ansible"{
 depends_on = [local_file.inventory_external]
 provisioner "local-exec" {
    when    = create
    command = "ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inv_external.ini ansibles/share_ssh_key.yml -e ansible_user=${var.default_user} -v "
 }

 provisioner "local-exec" {
    when    = create
    command = "ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inv_external.ini ansibles/installing_k3s_ansible.yml -e ansible_user=${var.default_user} -v "
}

}
