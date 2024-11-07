################################################## NODO BASTION ##################################################
locals {
    value_after_d_bastion = regex("d(\\d+)", var.flavor_of_bastion)[0]
  }

  resource "openstack_blockstorage_volume_v3" "myvol_bastion" {
    name = format("%s-bastion-volumen", data.terraform_remote_state.prueba.outputs.new_project_name_create)
    size = local.value_after_d_bastion
  }

  resource "openstack_compute_instance_v2" "bastion" {
    name = format("%s-bastion", data.terraform_remote_state.prueba.outputs.new_project_name_create)
    image_name      = var.image_name_bastion
    flavor_name     = var.flavor_of_bastion
    key_pair        = data.terraform_remote_state.prueba.outputs.new_keypair_name
    security_groups = [
      data.terraform_remote_state.prueba.outputs.new_secgroup_SSH_name,
      data.terraform_remote_state.prueba.outputs.new_secgroup_RKE2_name
    ]

    network {
      name = data.terraform_remote_state.prueba.outputs.new_net_name
    }
   }

  resource "openstack_compute_volume_attach_v2" "attached_bastion" {
    instance_id = openstack_compute_instance_v2.bastion.id
    volume_id   = openstack_blockstorage_volume_v3.myvol_bastion.id
  }


################################################## NODOS MASTER ##################################################
locals {
    value_after_d_master = regex("d(\\d+)", var.flavor_of_master)[0]
  }

  resource "openstack_blockstorage_volume_v3" "myvol_master" {
    for_each = { for i in range(1, var.number_of_master +1) : i => i }
    name = var.number_of_master == 1 ? format("%s-master-volumen", data.terraform_remote_state.prueba.outputs.new_project_name_create) : format("%s-master-volumen-%d", data.terraform_remote_state.prueba.outputs.new_project_name_create, each.key)
    size = local.value_after_d_master
  }

  resource "openstack_compute_instance_v2" "master" {
    for_each = { for i in range(1, var.number_of_master +1) : i => i }
    name = var.number_of_master == 1 ? format("%s-master", data.terraform_remote_state.prueba.outputs.new_project_name_create) : format("%s-master-%d", data.terraform_remote_state.prueba.outputs.new_project_name_create, each.key)
    image_name      = var.image_name
    flavor_name     = var.flavor_of_master
    key_pair        = data.terraform_remote_state.prueba.outputs.new_keypair_name
    security_groups = [
      data.terraform_remote_state.prueba.outputs.new_secgroup_SSH_name,
      data.terraform_remote_state.prueba.outputs.new_secgroup_RKE2_name
    ]

    network {
      name = data.terraform_remote_state.prueba.outputs.new_net_name
    }
   }

  resource "openstack_compute_volume_attach_v2" "attached_master" {
    for_each = "${openstack_compute_instance_v2.master}"
    instance_id = each.value.id
    volume_id   = openstack_blockstorage_volume_v3.myvol_master[each.key].id
  }


  ################################################## NODOS WORKER ##################################################

  locals {
    value_after_d_worker = regex("d(\\d+)", var.flavor_of_worker)[0]
  }

  resource "openstack_blockstorage_volume_v3" "myvol_worker" {
    for_each = { for i in range(1, var.number_of_worker +1) : i => i }
    name = var.number_of_worker == 1 ? format("%s-worker-volumen", data.terraform_remote_state.prueba.outputs.new_project_name_create) : format("%s-worker-volume-%d", data.terraform_remote_state.prueba.outputs.new_project_name_create, each.key)
    size = local.value_after_d_worker
  }

  resource "openstack_compute_instance_v2" "worker" {
    for_each = { for i in range(1, var.number_of_worker +1) : i => i }
    name = var.number_of_worker == 1 ? format("%s-worker", data.terraform_remote_state.prueba.outputs.new_project_name_create) : format("%s-worker-%d", data.terraform_remote_state.prueba.outputs.new_project_name_create, each.key)
    image_name      = var.image_name
    flavor_name     = var.flavor_of_worker
    key_pair        = data.terraform_remote_state.prueba.outputs.new_keypair_name
    security_groups = [
      data.terraform_remote_state.prueba.outputs.new_secgroup_SSH_name,
      data.terraform_remote_state.prueba.outputs.new_secgroup_RKE2_name
    ]

    network {
      name = data.terraform_remote_state.prueba.outputs.new_net_name
    }
  }

  resource "openstack_compute_volume_attach_v2" "attached_worker" {
    for_each = openstack_compute_instance_v2.worker
    instance_id = each.value.id
    volume_id = openstack_blockstorage_volume_v3.myvol_worker[each.key].id
  }
