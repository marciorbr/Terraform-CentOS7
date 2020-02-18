# Criando Máquina Virtual VMware CentOS 7 com Terraform

Este repositório contém projeto terraform para criar VM Linux no VMware vSphere.

 

# Utilização:

1. Renomeei o arquivo examplo_terraform.tfvar e insira o valores de seu ambiente.

2. Inicie os modulos e providers
```terminal
$ terraform init
```

3. Valide o código.

```command
$ terraform validate
Success! The configuration is valid.
```
4. Visualize o que seu código vai criar, alterar.
```terminal
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

module.vm_setup.data.vsphere_datacenter.dc: Refreshing state...
module.vm_setup.data.vsphere_compute_cluster.cluster: Refreshing state...
module.vm_setup.data.vsphere_network.network: Refreshing state...
module.vm_setup.data.vsphere_virtual_machine.template: Refreshing state...
module.vm_setup.data.vsphere_datastore.datastore: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
  ...
  ````


3. Por fim faça o Deploy.

```command
terraform apply
module.vm_setup.data.vsphere_datacenter.dc: Refreshing state...
module.vm_setup.data.vsphere_compute_cluster.cluster: Refreshing state...
module.vm_setup.data.vsphere_datastore.datastore: Refreshing state...
module.vm_setup.data.vsphere_network.network: Refreshing state...
module.vm_setup.data.vsphere_virtual_machine.template: Refreshing state...

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:
...
```

