# ---------------------------------
# Credênciais de acesso ao Provider
variable "vsphere_vcenter" {
  type        = "string"
  description = "Endereço do vCenter FQDN or IP"
}
variable "vsphere_user" {
  type         = "string"
  description  = " Nome de Usuário com acesso ao vSphere "
}
variable "vsphere_password" {
  type        = "string"
  description = " Senha do Usuário vSphere "
}
variable "vsphere_unverified_ssl" {
  description  =  " Certificado auto  assinado  (true / false) "
}

# ------------------------
# Configurações do vCenter

variable "vsphere_datacenter" {
  type        = "string"
  description = " DataCenter em que será feito Deploy da VM "
}
variable "vsphere_compute_cluster" {
  type        = "string"
  description = " Cluster em que será feito Deploy da VM "
}
variable "vsphere_datastore" {
  type        = "string"
  description = "Qual datastore será usado pela VM"
}
variable "vsphere_network" {
  type        = "string"
  description = "Qual rede será utilizado pela VM"
}
variable "vsphere_virtual_machine" {
  type        = "string"
  description = "Nome do Template que será clonado para criar a VM"
}
variable "vsphere_template_folder" {
  type        = "string"
  description = "Folder onde está o Template"
}

# -------------------------------
# Recursos e Especificações da VM
variable "vm_count" {
  description = "Numbero de VMs para criar no Cluster"
}
variable "vm_name" {
  type        = "list"
  default     = []
  description = "Lista de Nomes Utilizado pelas VMs no vCenter"
}
variable "vm_hostname" {
  type        = "list"
  default     = []
  description = "Lista de Nomes 'hostname' Utilizado pelas VMs"
}
variable "vm_folder" {
  type        = "string"
  description = "Em qual pasta a VM será armazedada"
}
variable "vm_domain" {
  type        = "string"
  default     = " Domínio utilizado pelas VMs"
}
variable "vm_ip" {
  type        = "list"
  default     = []
  description = "Lista de IPs Utilizado pelas VMs"
}
variable "vm_mask" {
  type        = "string"
  description = "Máscara de Rede das VMs"
}
variable "vm_gateway" {
  type        = "string"
  description = "Gateway das Vms"
}
variable "vm_dns_domain" {
  type        = "string"
  description = "DNS Domain Utilizados pelas Vms"
}
variable "vm_dns_servers" {
  type        = "string"
  description = "lista de Endereços DNS"
}
variable "vm_cpus" {
  type        = "string"
  description = "Quantidade de CPU utilizada pela VM"
}
variable "vm_cores_per_socket" {
  type        = "string"
  description = "Quantidade de Cores por CPU utilizada pela VM"
}
variable "vm_memory" {
  type        = "string"
  description = "Quantidade de Memória da VM"
}
variable "vm_disk" {
  type        = "string"
  description = "Tamanho do Disco da VM"
}
variable "vm_timezone" {
  type        = "string"
  description = " Timezone utilizado pela VM "
  default     = "UTC"
}
variable "vm_linked_clone" {
  description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default = "false"
}