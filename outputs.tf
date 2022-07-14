output "ip-addr" {
	
	value = proxmox_vm_qemu.server-demo[*].ssh_host
	description = "SSH Address:"
	}