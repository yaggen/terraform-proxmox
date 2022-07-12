resource "proxmox_vm_qemu" "server-demo" {

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

	ciuser = "yag"
	cipassword = var.cipassword
	sshkeys = <<EOF
	ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqMmXEJ1d0U78krNDYcn3jYnLOuUGdsC0czaM+OnXd7JP4W5YozDD6AiVC9ipVvEN3DSYoVgsV45HTOxy2KDnVZMt7r2TeO06n62Vl7/GknqKH+s+TfdqAoFGq5HOI/E245+Wc1Sics/UI0dlVs1iy6rHwMuffTb08D7Kot+nLlrTsm1U3EmoA9cxmqnZa0dkCYkgJ2zs7YSkVZ41NxafnQ4FKp2qg5Edwa3IBqfUghQ93AEQCF1Znjv/OXzstgWRQN/pd+EXxGD2s+b+qXhDuqNxEiD/70Y7xq2lg2aMj3rbcQI5TThZimlOMI+PC7sbH/fsuzWAT+5vUBbidXBwBUbetkW1i+ybqr4ZOCh+iH8GK85gDOauy5PsxqpgxKlut4D2BmkTSycxxVUyjgl/S0vUObnni1rxuk9MEnO/40AaCDPKM+HY3guVOijd5IQbgpFrw/dgiZtEU1gj0ukRuZFbboSxML6ugAB2pH9za+/vlz07N5aswiKlpEUJDKi8=
	EOF

}