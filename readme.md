# Lou's Azure Estate:

A development environment in Azure. Written in Terraform

## Changelog:
### v1.1
- **Organised Azure estate to all come out of one repository**
    - All future infrastructure changes will be built here and stay in this repository
    - Created runbook environment to replace viper vm for cost savings
        - More details of this change on the repo itself | https://github.com/louisruocco/Nonna

### v1.0:
- **Initial Commit**
    - Added security rule in NSG to allow ICMP between the 2 VMs
    - Altered the dynamic private IP addresses of the VMs to be static 
    - Removed Public IP address from vmdev2 as unnecessary to have
    - Added more variables to incorporate private IP address prefixes