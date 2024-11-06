# openstack-terraform
## Repository on automation of a project in openstack

**Directory structure**
```
deploy-project/
├── README.md
|
├── mv_create/
│   ├── main.tf
│   ├── resource.tf
│   └── variables.tf
|
├── project_userdom/
│   ├── project/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── resource.tf
│   │   └── variables.tf
│   |
│   └── user_dom/
│       ├── main.tf
│       ├── outputs.tf
│       ├── resource.tf
│       └── variables.tf
|
└── components/
    ├── main.tf
    ├── outputs.tf
    ├── resource.tf
    └── variables.tf
```
 
**Its execution must be in the following order.**


     1. deploy-project/project_userdom/project/
     2. deploy-project/project_userdom/user_dom/
     3. deploy-project/components/
     4. deploy-project/mv_create/

 

**Actions performed by each code**

    deploy-project/project_userdom/project/

> It allows us to create a project associated to a domain and assign a
> role to it.

    deploy-project/project_userdom/user_dom/

>create an openstack user to a specific project and domain

    deploy-project/components/

>creation of a complete network for the project, as well as security groups and SSH keys.

    deploy-project/mv_create/

>automates the creation of a cluster, using bastion, master and worker.


**Prerequisites**
It is necessary to install terraform, for this I attach the URL [hashicorp](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


**Code execution**


In all the directories, we will find a file `variables.tf`
This is the only one we will have to modify and inside it the variables with the `default` value.

In the first two steps we will be asked for the credentials of the administrator user, in the third and fourth steps the credentials of the created user will be used.

It is also important to check that the `terraform.tfstate` file is generated, as we will need it for the following codes

 1. **First execution**

     `deploy-project/project_userdom/project/variables.tf`

For this code we will need to know the ID of the domain where we will deploy the project.

To create a project in openstack, just run the following command

    openstack domain create --description ‘<description>’ <domain name>

All the default fields must be filled in
The provider section will depend on the infrastructure.
In the variables for the resources we must complete the following fields:

```terraform

     #Variables for authentication
     
    variable  "openstack_user_name" {
    
    description =  "Administrator user with which we are going to create the project"
    
    default =  ""
    
    }
    
    variable  "openstack_password" {
    
    description =  "Password for the user who is going to create the resources"
    
    type =  string
    
    sensitive =  true
    
    }
    
    variable  "openstack_tenant_name" {
    
    description =  "Project where the admin user is authenticated"
    
    default =  ""
    
    }
    
    variable  "openstack_auth_url" {
    
    description =  "URL of the Openstack environment api with /v3"
    
    default =  "http://x.x.x.x:5000/v3"
    
    }
    
    variable  "openstack_region" {
    
    description =  "Region Openstack"
    
    default =  "RegionOne"
    
    }
    
    ## Variables to create the project
    
    variable  "project_name" {
    
    description =  "name of the project to create"
    
    default =  ""
    
    }
    
    variable  "project_desc" {
    
    description =  "description of the project to create"
    
    default =  ""
    
    }
    
    variable  "id_dominio" {
    
    description =  "ID of the domain where this project will be created"
    
    default =  ""
    
    }
```


to initialise the workspace, execute the following command.
```hcl
terraform init
```
validate syntax and consistency of the code
```hcl
terraform plan
```

apply the changes in openstack
```hcl
terraform apply
```

2. **second execution**

    `deploy-project/project_userdom/user_dom/variables.tf`

In this case it is only necessary to execute the code, since the variables are already filled in with the terraform.tfstate file, this also applies to the remaining directories.

to initialise the workspace, execute the following command.
```hcl
terraform init
```
validate syntax and consistency of the code
```hcl
terraform plan
```

apply the changes in openstack
```hcl
terraform apply
```

`you must enter a new password for the user that is being created.`

3. **third execution**
   
    `deploy-project/components/variables.tf`

In this case we will choose the CIDR of the network and where the keys are stored.

```terraform

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
```


to initialise the workspace, execute the following command.
```hcl
terraform init
```
validate syntax and consistency of the code
```hcl
terraform plan
```

apply the changes in openstack
```hcl
terraform apply
```

`password of the user we created in the second step`

4. **fourth execution**

    `deploy-project/mv_create/variables.tf`

In this step we will indicate the version of the operating system and the number of nodes to create.

```terraform
variable "openstack_password" {
    description = "Password of the user of the domain with which the resources are to be created"    
    type = string
    sensitive = true
}

variable "image_name" {
    description = " image name for master and worker nodes "
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
```

to initialise the workspace, execute the following command.
```hcl
terraform init
```
validate syntax and consistency of the code
```hcl
terraform plan
```

apply the changes in openstack
```hcl
terraform apply
```

`password of the user we created in the second step`


**NOTE:**

``this code applies to the complete creation of a project, having as reference the name of the project that is indicated.
As an example, if the project is called TEST, the router that will be created will be called TEST-ROUTER and this will happen with all the components.``

``in addition to the IDs, which are found in the resource.tf file, these will depend on the infrastructure.``
















