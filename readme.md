# Lou's Dev Environment:

A development in Azure. Written in Terraform

## Changelog:

### v1.1
- Added security rule in NSG to allow ICMP between the 2 VMs
- Altered the dynamic private IP addresses of the VMs to be static 
- Removed Public IP address from vmdev2 as unnecessary to have
- Added more variables to incorporate private IP address prefixes

### v1.0:
- Initial Commit