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
  user_name   = data.terraform_remote_state.prueba.outputs.user_openstack_admin
  tenant_name = data.terraform_remote_state.prueba.outputs.user_openstack_project_login
  password    = var.openstack_password
  auth_url    = data.terraform_remote_state.prueba.outputs.url_api_5000_v3
  region      = data.terraform_remote_state.prueba.outputs.region
}
