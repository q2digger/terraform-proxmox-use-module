1. git clone .. 
2. cd repo
3. cp secret.tfvars.example secret.tfvars
4. fill all required fields in the secret.tfvars with your settings
5. terraform init
6. terraform plan -var-file="secret.tfvars"
7. terraform apply -var-file="secret.tfvars"
8. PROFIT!!!


Important notes
1. Check documentation to proxmox module - it contains important information how to prepare API user (issues with permissions)
2. Check variables.tf - it contains my nodes definition, but you need feel it with yourself nodenames. 
3. Template name - quite important - as i don't have shared storage in my testing Proxmox environment , i had to prepare same templates on all nodes. 

Just for remember: 

- wget https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img
- qm create 9002 --name **ubuntu-2004-cloud-init** --numa 0 --ostype l26 --cpu cputype=host --cores 2 --sockets 1 --memory 2048 --net0 virtio,bridge=vmbr0
- qm importdisk 9002 /tmp/ubuntu-20.04-server-cloudimg-amd64.img DATA
- qm set 9002 --scsihw virtio-scsi-pci --scsi0 DATA:9002/vm-9002-disk-0.raw
- qm set 9002 --ide2 DATA:cloudinit
- qm set 9002 --boot c --bootdisk scsi0
- qm set 9002 --serial0 socket --vga serial0
- qm set 9002 --agent enabled=1
- .. prepare you virtual machine , and then create template 
- qm template 9002

