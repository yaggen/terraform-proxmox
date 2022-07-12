# Learn Terraform 
So i have spent the last few days on my vacation trying to get a grasp around terraform.  Terraform is a powerful tool designed to deploy infrastructure across various providers, more about terraform [here](https://terraform.io)

Since i run a proxmox lab myself at home, i figured out a good test would be to use terraform to deploy VMs inside my Proxmox node.


# requirements.txt

First i had to create a template VM, this makes it easier to deploy identical machines. 

I downloaded debian 11 (bullseye) cloud-init [image](https://cloud.debian.org/images/cloud/bullseye/latest/) and followed [these](https://vectops.com/2020/05/provision-proxmox-vms-with-terraform-quick-and-easy/) instructions to attach it to a VM, which i then converted into a template. 

The process of creating api tokens in proxmox to use with terraform is also described in above blogpost

### Resources
- https://vectops.com/2020/05/provision-proxmox-vms-with-terraform-quick-and-easy/
- https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/
- https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/
