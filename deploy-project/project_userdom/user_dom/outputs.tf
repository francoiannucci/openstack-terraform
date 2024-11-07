output user_openstack_admin {
    value = data.terraform_remote_state.prueba.outputs.user_openstack_admin
}

output user_openstack_project_login {
    value = data.terraform_remote_state.prueba.outputs.user_openstack_project_login
}

output url_api_5000_v3 {
    value = data.terraform_remote_state.prueba.outputs.url_api_5000_v3
}

output region {
    value = data.terraform_remote_state.prueba.outputs.region
}

output new_project_name_create {
    value = data.terraform_remote_state.prueba.outputs.new_project_create
}

output project_id {
    value = data.terraform_remote_state.prueba.outputs.project_id
}

output domain_id {
    value = data.terraform_remote_state.prueba.outputs.domain_id
}

output id_group_hylabs_admin {
    value = data.terraform_remote_state.prueba.outputs.id_group_hylabs_admin
}

output role_admin_id {
    value = data.terraform_remote_state.prueba.outputs.role_admin_id
}

output role_id_member {
    value = openstack_identity_role_assignment_v3.role_assignment3.role_id
}

output new_user_create {
    value = openstack_identity_user_v3.user1.name
}


