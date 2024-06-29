# Lou's Azure Estate:

A development environment in Azure. Written in Terraform

## Changelog:
### v2.1
- **Fitness Runbook added** | In Progress
    - Created a Fitness Runbook which will create workout plans based on set criteria and send them on an email to me every Tuesday and Thursday

### v2.0:
- **Nonna Runbook added**
    - Migrated Nonna fully into an Azure Runbook from the viper VM
    - Viper VM now decommissioned
    - More details of this change on the repo itself | https://github.com/louisruocco/Nonna

### v1.1:
- **Organised Azure estate to all come out of one repository**
    - All future infrastructure changes will be built here and stay in this repository

### v1.0:
- **Initial Commit**
    - Added security rule in NSG to allow ICMP between the 2 VMs
    - Altered the dynamic private IP addresses of the VMs to be static 
    - Removed Public IP address from vmdev2 as unnecessary to have
    - Added more variables to incorporate private IP address prefixes