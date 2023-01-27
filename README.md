# Principe
Ce dépot permet de déployer un Cluster Kubernetes K3S à l'aide du projet [k3s-ansible](https://github.com/k3s-io/k3s-ansible) de manière simple (ou brouillon)

# Arborescence

On suggère que la clé privée (générée via l'interface horizon dans ce cas) est
présente dans le dossier **parent** à ce dépot. 

```
├── kubernetes-infomaniak
│   ├── ansibles
│   │   ├── installing_k3s_ansible.yml
│   │   └── share_ssh_key.yml
│   ├── inventory.tf
│   ├── modules
│   │   └── instance
│   │       ├── instance.tf
│   │       ├── outputs.tf
│   │       ├── providers.tf
│   │       └── variables.tf
│   ├── modules.tf
│   ├── network.tf
│   ├── provisionning.tf
│   ├── secgroup.tf
│   ├── terragrunt.hcl
│   └── variables.tf
├── privkey
└── terragrunt.hcl
```

vous aurez également besoin de créer un fichier *terragrunt.hcl* sur le dossier parent (dont la configuration est appelée par le fichier *terragrunt.hcl* du dépot)

```hcl
# Fichier ../terragrunt.hcl
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.44.0"
    }
  }
}

# Configuration du provider OpenStack
provider "openstack" {
  auth_url = "https://api.pub1.infomaniak.cloud/identity" # tests réalisés sur le Cloud publique de Infomaniak
  region = ""
  user_name = ""
  password = ""
  user_domain_name = "Default"
  project_domain_id = "default"
  tenant_id = ""
  tenant_name = ""
}
EOF
}
```

# TO-DO

- Créer un module pour les règles de sécurités  

