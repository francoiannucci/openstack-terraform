# openstack-terraform
## Repository on automation of a project in openstack

**Directory structure**
```
deploy-project/
├── README.md
|
├── mv_create/
│   ├── main.tf
│   ├── outputs.tf
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
This is the only one we will have to modify as we want to create the project.

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

     #Variables para autenticación
    ```terraform
    variable  "openstack_user_name" {
    
    description =  "Usuario administrador con el que vamos a crear el proyecto"
    
    default =  "admin"
    
    }
    
    variable  "openstack_password" {
    
    description =  "Contraseña para el usuario que va a crear los recursos"
    
    type =  string
    
    sensitive =  true
    
    }
    
    variable  "openstack_tenant_name" {
    
    description =  "Proyecto donde se autentica el usuario administrador"
    
    default =  "admin"
    
    }
    
    variable  "openstack_auth_url" {
    
    description =  "URL de la api del entorno de Openstack con /v3"
    
    default =  "http://10.24.4.60:5000/v3"
    
    }
    
    variable  "openstack_region" {
    
    description =  "Region Openstack"
    
    default =  "RegionOne"
    
    }
    
    ## Variables para recursos
    
    variable  "project_name" {
    
    description =  "Nombre del proyecto que vamos a crear"
    
    default =  "test-franco"
    
    }
    
    variable  "project_desc" {
    
    description =  "Descripcion del proyecto que vamos a crear"
    
    default =  "test-franco"
    
    }
    
    variable  "id_dominio" {
    
    description =  "ID de dominio sobre"
    
    default =  "043d786cdc264ba6a1dc640f4be7f732"
    
    }
```terraform


to initialise the workspace, execute the following command.
terraform init

validate syntax and consistency of the code
terraform plan

apply the changes in openstack
terraform apply


deploy-project/project_userdom/user_dom/variables.tf

In this case it is only necessary to execute the code, since the variables are already filled in with the terraform.tfstate file, this also applies to the remaining directories.

to initialise the workspace, execute the following command.
terraform init

validate syntax and consistency of the code
terraform plan

apply the changes in openstack

``` console
terraform apply
```


you must enter a new password for the user that is being created.


deploy-project/components/variables.tf

In this case we will choose the CIDR of the network and where the keys are stored.

cidr_net -> network we are going to create with its mask
folder_path -> path to the folder where the keys are stored (pub,pem)

to initialise the workspace, execute the following command.
terraform init

validate syntax and consistency of the code
terraform plan

apply the changes in openstack
terraform apply

password for the user we have just created


deploy-project/mv_create/variables.tf

In this step we will indicate the version of the operating system and the number of nodes to create.

image_name -> image name for master and worker nodes 
image_name_bastion -> name of the bastion image
number_of_master -> number of master nodes
number_of_worker-> number of worker nodes
flavor_of_master -> flavour master nodes 
flavor_of_worker -> flavor worker nodes 
flavor_of_bastion -> flavor of the bastion node
```
variable  "flavor_of_bastion" {
description =  "flavor para el nodo bastion"
type =  string
default =  "c2.m4.d50"
}
```

to initialise the workspace, execute the following command.
terraform init

validate syntax and consistency of the code
terraform plan

apply the changes in openstack
terraform apply

password for the user we have just created
















