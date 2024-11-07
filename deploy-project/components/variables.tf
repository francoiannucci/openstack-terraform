
variable "openstack_password" {
    description = "Password of the user of the domain with which the resources are to be created"
    type = string
    sensitive = true
}

variable "cidr_net" {
    description = "CIDR network we are going to create with its mask"
    default = ""
}

variable "ruta_carpeta" {
  description = "path to the folder where the keys are stored (pub,pem)"
  default = ""
}



