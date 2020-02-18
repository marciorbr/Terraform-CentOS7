# ---------------------------------
# Credênciais de acesso ao Provider
vsphere_vcenter = ""
vsphere_user = "administrator@vsphere.local"
vsphere_password = ""
vsphere_unverified_ssl = "true"

# ------------------------
# Dados do Vcenter
vsphere_datacenter = "DC"
vsphere_compute_cluster = "Cluster"
vsphere_datastore = "Storage"
vsphere_network = "Network"
vsphere_virtual_machine = "CentOS7-Template"
vsphere_template_folder = "Templates"

# -------------------------------
# Recursos e Especificações da VM
vm_count = 1
vm_name = ["master1"]
vm_hostname = ["master1"]
vm_folder = "K8S"
vm_domain = "lab.local"
vm_ip = ["10.142.142.247"]
vm_mask = "24"
vm_gateway = "10.142.142.201"
vm_dns_domain = "lab.local"
vm_dns_servers = "10.142.142.242"
vm_cpus = "1"
vm_cores_per_socket = "2"
vm_memory = "1024"
vm_disk = "65"
vm_timezone = "America/Porto_Velho"
vm_linked_clone = "false"