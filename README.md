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







