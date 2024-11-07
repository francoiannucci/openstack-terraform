#Variables for authentication

variable "openstack_password" {
    description = "Password for the administrator user with which we are going to create the domain user"
    type = string
    sensitive = true
}

variable "passwd_user" {
    description = "Password of the user of the domain we are going to create"
    type = string
    sensitive = true
}



