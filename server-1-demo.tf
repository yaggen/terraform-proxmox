resource "proxmox_vm_qemu" "server-demo-1" {

	name = "srv-demo-${count.index}"
	count = 2
	desc = "Terraform test"
	target_node = "labbet"
	agent = 1
	clone = "debian-11-template"
	cores = 2
	sockets = 1
	memory = 1024
	cpu = "host"

	network {
		bridge = "vmbr0"
		model = "virtio"
	}

	disk {
		storage = "local-lvm"
		type = "virtio"
		size = "10G"
	}

	os_type = "cloud-init"
	sshkeys = <<EOF
	ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsbXDpkrHdCaU+CVutDXbs/SDi4ctf208tbur+cMBZriRUvt0UaQq5+X7ynEAkcDA9Cd+h02Cf5XK1u2HazfujnqGRRTrdgRPsTaz6tiulwBpdW8OUni3HtjQl7sRmHODxlg3NO6tvn3aBkSTF0XWU0ej8NKdJk9DlFq0Z1p3YUFer4FPOtz+JUCjeuElMD4lxfAmQw4+pYiRvrkX3RBLmsugPyIfr8Xquhx540e+DBrOaqUKtKC/SLqnBaLCWO83fNGUEWuQaVnyAisJBtHEbTdZWIOoRp1zFRfKQSGm205aOHdtYamaQo9xv9EeLvEGtNsBAt7ffnTyoXj7b9jpH
	EOF

}