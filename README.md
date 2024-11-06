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
2) deploy-project/project_userdom/user_dom
3) deploy-project/components/
4) deploy-project/mv_create/
