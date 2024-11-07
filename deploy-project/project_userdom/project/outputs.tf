output user_openstack_admin {
    value = var.openstack_user_name 
}

output user_openstack_project_login {
    value = var.openstack_tenant_name
}

output url_api_5000_v3 {
    value = var.openstack_auth_url
}

output region {
    value = var.openstack_region
}

output new_project_create {
    value = var.project_name
}

output new_project_create_description {
    value = var.project_desc
}

output domain_id {
    value = var.id_dominio
}

output id_group_hylabs_admin {
    value = openstack_identity_role_assignment_v3.role_assignment.group_id
}

output role_admin_id {
    value = openstack_identity_role_assignment_v3.role_assignment.role_id
}

output project_id {
    value = openstack_identity_project_v3.project1.id
}
