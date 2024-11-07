resource "openstack_identity_project_v3" "project1" {
  name = var.project_name
  domain_id = var.id_dominio
  description = var.project_desc
  region = "RegionOne"
}

resource "openstack_identity_role_assignment_v3" "role_assignment" {
  group_id = "88668ab19e384f9c8c7471839627c7f1"
  project_id = "${openstack_identity_project_v3.project1.id}"
  role_id = "37bde690f7bb4497b3286469535928f3"
}