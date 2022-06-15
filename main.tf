provider "proxmox" {
    pm_api_url = var.pm_api_url
    pm_api_token_id = var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret
    pm_tls_insecure = true
}

module "proxmox-vm-create" {
    source = "github.com/q2digger/terraform-proxmox-module-create-vm"
    # source = "../tf.modules/proxmox-vm-create"
    
    for_each = toset(var.proxmox_host)
    proxmox_host = each.value

    ssh_key = var.ssh_key

    pm_api_token_id = var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret
    pm_api_url = var.pm_api_url

    count_vms = var.count_vms

}