# openstack-terraform
Repository on automation of a project in openstack

Directory structure

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

 
Its execution must be in the following order.

1) deploy-project/project_userdom/project/
2) deploy-project/project_userdom/user_dom/
3) deploy-project/components/
4) deploy-project/mv_create/



Actions performed by each code

deploy-project/project_userdom/project/

It allows us to create a project associated to a domain and assign a role to it.

deploy-project/project_userdom/user_dom/

create an openstack user to a specific project and domain

deploy-project/components/

creation of a complete network for the project, as well as security groups and SSH keys.

deploy-project/mv_create/

automates the creation of a cluster, using bastion, master and worker.

Prerequisites
It is necessary to install terraform, for this I attach the URL
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Code execution

In all the directories, we will find a file variables.tf.
This is the only one we will have to modify as we want to create the project.

deploy-project/project_userdom/project/variables.tf

For this code we will need to know the ID of the domain where we will deploy the project.
To create a project in openstack, just run the following command
openstack domain create --description ‘<description>’ <domain name>.
All the default fields must be filled in
The provider section will depend on the infrastructure.
In the variables for the resources we must complete the following fields:

project_name -> name of the project to create
project_desc -> description of the project to create
id_domain -> ID of the domain where this project will be created


to initialise the workspace, execute the following command.

terraform init

validate syntax and consistency of the code
terraform plan

apply the changes in openstack
terraform apply











