    #Variables for authentication
variable "openstack_user_name" {
    description = "Administrator user with which we are going to create the project"
    default = ""
}

variable "openstack_password" {
    description = "Password for the user who is going to create the resources"
    type = string
    sensitive = true
}

variable "openstack_tenant_name" {
    description = "Project where the admin user is authenticated"
    default = ""
}

variable "openstack_auth_url" {
    description = "URL of the Openstack environment api with /v3"
    default = ""
}

variable "openstack_region" {
    description = "Region Openstack"
    default  = ""
}

    #Variables to create the project

variable "project_name" {
    description = "name of the project to create"
    default = ""
}

variable "project_desc" {
    description = "description of the project to create"
    default = ""
}

variable "id_dominio" {
    description = "ID of the domain where this project will be created"
    default = ""
}


