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
    value = data.terraform_remote_state.prueba.outputs.new_project_name_create
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
    value = data.terraform_remote_state.prueba.outputs.role_id_member
}

output new_user_create {
    value = data.terraform_remote_state.prueba.outputs.new_user_create
}

############output del resource###################3
output new_net_name {
    value = openstack_networking_network_v2.network1.name
}

output new_secgroup_RKE2_name {
    value = openstack_networking_secgroup_v2.RKE2-SG.name
}

output new_secgroup_SSH_name {
    value = openstack_networking_secgroup_v2.SSH_SG.name
}

output new_keypair_name {
    value = openstack_compute_keypair_v2.clave.name
}

