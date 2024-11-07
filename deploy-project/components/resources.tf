resource "openstack_networking_network_v2" "network1" {
  name = format("%s-net", data.terraform_remote_state.prueba.outputs.new_project_name_create)
  tenant_id = data.terraform_remote_state.prueba.outputs.project_id
  region = "RegionOne"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name = format("%s-subnet", data.terraform_remote_state.prueba.outputs.new_project_name_create)
  tenant_id = data.terraform_remote_state.prueba.outputs.project_id
  network_id = "${openstack_networking_network_v2.network1.id}"
  cidr = var.cidr_net
  ip_version = 4
  dns_nameservers = ["172.22.229.5","192.168.10.15"]
}

resource "openstack_networking_router_v2" "router_1" {
  name = format("%s-router", data.terraform_remote_state.prueba.outputs.new_project_name_create)
  tenant_id = data.terraform_remote_state.prueba.outputs.project_id
  external_network_id = "50728e89-6bc7-45f0-979e-cacb3a5f47fa"
}

resource "openstack_networking_router_interface_v2" "iface_int" {
  router_id = "${openstack_networking_router_v2.router_1.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet.id}"
}

resource "openstack_networking_secgroup_v2" "SSH_SG" {
  name        = "SSH"
  tenant_id = data.terraform_remote_state.prueba.outputs.project_id
}

resource "openstack_networking_secgroup_rule_v2" "ssh_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "10.22.231.128/27"
  security_group_id = "${openstack_networking_secgroup_v2.SSH_SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ssh_rule_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "10.22.236.0/22"
  security_group_id = "${openstack_networking_secgroup_v2.SSH_SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ssh_rule_3" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.SSH_SG.id}"
}

resource "openstack_networking_secgroup_v2" "RKE2-SG" {
  name        = "SG-RKE2-${data.terraform_remote_state.prueba.outputs.new_project_name_create}"
  tenant_id = data.terraform_remote_state.prueba.outputs.project_id
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 179
  port_range_max    = 179
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_3" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2379
  port_range_max    = 2379
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_5" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2380
  port_range_max    = 2380
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_6" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5473
  port_range_max    = 5473
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_7" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6443
  port_range_max    = 6443
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_8" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9098
  port_range_max    = 9098
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_9" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9099
  port_range_max    = 9099
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_10" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9345
  port_range_max    = 9345
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_11" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10250
  port_range_max    = 10250
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_12" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30000
  port_range_max    = 32767
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_13" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 4789
  port_range_max    = 4789
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "openstack_networking_secgroup_rule_v2" "rke2_rule_14" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8472
  port_range_max    = 8472
  remote_ip_prefix  = var.cidr_net
  security_group_id = "${openstack_networking_secgroup_v2.RKE2-SG.id}"
}

resource "null_resource" "crear_carpeta" {
  provisioner "local-exec" {
    command = "mkdir -p ${var.ruta_carpeta}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}"
  }
}

resource "openstack_compute_keypair_v2" "clave" {
  name       = format("%s-key", data.terraform_remote_state.prueba.outputs.new_project_name_create)
}

resource "null_resource" "guardar_claves" {
  depends_on = [null_resource.crear_carpeta, openstack_compute_keypair_v2.clave]

  provisioner "local-exec" {
    command = <<EOT
      echo -n "${openstack_compute_keypair_v2.clave.private_key}" | tr -d '\r' > ${var.ruta_carpeta}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}.pem
      echo -n "${openstack_compute_keypair_v2.clave.public_key}" | tr -d '\r' > ${var.ruta_carpeta}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}.pub
      chmod 0600 ${var.ruta_carpeta}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}.pem
      chmod 0700 ${var.ruta_carpeta}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}/${data.terraform_remote_state.prueba.outputs.new_project_name_create}.pub
    EOT
  }
}

data "terraform_remote_state" "prueba" {
  backend = "local"

  config = {
  path = "/deploy-project/project_userdom/user_dom/terraform.tfstate"
  }
}
