variable "internal_net" {
  type = string
  default = "kubenode_internal_network"
}

variable "external_net" {
  type = string
  default = "ext-net1"
}

variable "net_cidr" {
  type = string
  default = "192.168.128.0/24"
}

variable "default_user" {
  type = string
  default = "ubuntu"
}

variable "image_id" {
  type = string
  default = "4262b71d-b0a5-45fa-b35f-05f4b9168a71"
}
