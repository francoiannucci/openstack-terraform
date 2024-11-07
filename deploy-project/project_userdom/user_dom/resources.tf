resource "openstack_identity_user_v3" "user1" {
  domain_id = data.terraform_remote_state.prueba.outputs.domain_id
  name = format("%s-user", data.terraform_remote_state.prueba.outputs.new_project_create)
  description = "A user"
  password = var.passwd_user
  ignore_change_password_upon_first_use = true
}

resource "openstack_identity_role_assignment_v3" "role_assignment2" {
  user_id = "${openstack_identity_user_v3.user1.id}"
  project_id = data.terraform_remote_state.prueba.outputs.project_id
  role_id = "20dbe57035584060af420ecdb840cdf1"
}

resource "openstack_identity_role_assignment_v3" "role_assignment3" {
  user_id = "${openstack_identity_user_v3.user1.id}"
  domain_id = data.terraform_remote_state.prueba.outputs.domain_id
  role_id = "20dbe57035584060af420ecdb840cdf1"
}

data "terraform_remote_state" "prueba" {
  backend = "local"

  config = {
  path = "deploy-project/project_userdom/project/terraform.tfstate"
  }
}
