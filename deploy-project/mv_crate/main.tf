terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48.0"
    }
  }
}

provider "openstack" {
  user_name   = data.terraform_remote_state.prueba.outputs.new_user_create
  tenant_name = data.terraform_remote_state.prueba.outputs.new_project_name_create
  password    = var.openstack_password
  auth_url    = data.terraform_remote_state.prueba.outputs.url_api_5000_v3
  region      = data.terraform_remote_state.prueba.outputs.region
  domain_id   = data.terraform_remote_state.prueba.outputs.domain_id
}

data "terraform_remote_state" "prueba" {
  backend = "local"

  config = {
  path = "deploy-project/components/terraform.tfstate"
  }
}


