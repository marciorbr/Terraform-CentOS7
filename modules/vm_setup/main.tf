data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}
data "vsphere_compute_cluster" "cluster" {
  name = "${var.vsphere_compute_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_datastore" "datastore" {
  name = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network" {
  name = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "template" {
  name = "${var.vsphere_virtual_machine}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "CloneVM" {
  count            = "${var.vm_count}"
  name             = "${element(var.vm_name,count.index)}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}" 
  folder           = "${var.vm_folder}"

  num_cpus = "${var.vm_cpus}"
  num_cores_per_socket   = "${var.vm_cores_per_socket}"
  memory   = "${var.vm_memory}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${var.vm_disk}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone  = "${var.vm_linked_clone}"

    customize {
      timeout = "20"

      linux_options {
        host_name = "${element(var.vm_hostname,count.index)}"
        domain    = "${var.vm_domain}"
        time_zone = "${var.vm_timezone}"
      }

      network_interface {
        ipv4_address = "${element(var.vm_ip,count.index)}"
        ipv4_netmask = "${var.vm_mask}"
      }

      ipv4_gateway    = "${var.vm_gateway}"
      dns_suffix_list = ["${var.vm_dns_domain}"]
      dns_server_list = ["${var.vm_dns_servers}"]
    }
  }
}