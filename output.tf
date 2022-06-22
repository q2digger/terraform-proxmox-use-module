output "address_and_name" {
  value = values(module.proxmox-vm-create)[*].instance_name_and_ip
}
