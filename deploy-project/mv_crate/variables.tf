variable "openstack_password" {
    description = "Password of the user of the domain with which the resources are to be created"    
    type = string
    sensitive = true
}

variable "image_name" {
    description = "image name for master and worker nodes"
    default = ""
}

variable "image_name_bastion" {
    description = "name of the bastion image"
    default = ""
}

variable "number_of_master" {
    description = "number of master nodes"
    type    = number
    default = 1
}

variable "number_of_worker" {
    description = "number of worker nodes"
    type    = number
    default = 2
}

variable "flavor_of_master" {
    description = "flavour master nodes"
    type = string
    default = ""
}

variable "flavor_of_worker" {
    description = "flavor worker nodes"
    type = string
    default = ""
}

variable "flavor_of_bastion" {
    description = "flavor of the bastion node"
    type = string
    default = ""
}

