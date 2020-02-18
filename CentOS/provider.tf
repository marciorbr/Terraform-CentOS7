# --------------------
# vSphere Provider

provider "vsphere" {
  version        = "1.14.0"
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  vsphere_server       = "${var.vsphere_vcenter}"

  allow_unverified_ssl = "${var.vsphere_unverified_ssl}"
}