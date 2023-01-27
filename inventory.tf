resource "local_file" "inventory-internal" {
    filename = "./inv_internal.ini"
    content     = <<_EOF
[master]
%{ for index, dns in module.kubemaster.*.instance_name ~}
${module.kubemaster[index].instance_name} ansible_host=${module.kubemaster[index].int_ip}
%{ endfor }
[node]
%{ for index, dns in module.kubenode.*.instance_name ~}
${module.kubenode[index].instance_name} ansible_host=${module.kubenode[index].int_ip}
%{ endfor }
[k3s_cluster:children]
master
node
_EOF
 depends_on = [module.kubenode,module.kubemaster]
}



resource "local_file" "inventory_external" {
    filename = "./inv_external.ini"
    content     = <<_EOF
[master]
%{ for index, dns in module.kubemaster.*.instance_name ~}
${module.kubemaster[index].instance_name} ansible_host=${module.kubemaster[index].ext_ip}
%{ endfor }
[node]
%{ for index, dns in module.kubenode.*.instance_name ~}
${module.kubenode[index].instance_name} ansible_host=${module.kubenode[index].ext_ip}
%{ endfor }
[k3s_cluster:children]
master
node
_EOF
 depends_on = [module.kubenode,module.kubemaster]
}
