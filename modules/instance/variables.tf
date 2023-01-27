variable "internal_net" {
  type = string
  default = "kubenode_internal_network"
}

variable "external_net" {
  type = string
  default = "ext-net1"
}

variable "image_id" {
  type = string
  default = "4262b71d-b0a5-45fa-b35f-05f4b9168a71"
}

variable "flavor_name" {
  type = string
  default = "a1-ram2-disk80-perf1"
}

variable "instance_name" {
  type = string
  default = "undefinied_name"
}
