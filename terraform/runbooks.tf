data "local_file" "nonna-script" {
  filename = "./nonna-script.ps1"
}

resource "azurerm_automation_runbook" "rb-nonna" {
  name                    = "nonnascript"
  location                = azurerm_resource_group.nonna-rg.location
  resource_group_name     = azurerm_resource_group.nonna-rg.name
  automation_account_name = azurerm_automation_account.nonna-autoacc.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "Nonna main script"
  runbook_type            = "PowerShellWorkflow"

  content = data.local_file.nonna-script.content
}

resource "azurerm_automation_schedule" "nonna-schedule" {
  name                    = "nonnaschedule"
  resource_group_name     = azurerm_resource_group.nonna-rg.name
  automation_account_name = azurerm_automation_account.nonna-autoacc.name
  frequency               = "Week"
  interval                = 1
  timezone                = "Europe/London"
  start_time              = "2024-05-20T18:08:00+00:00"
  description             = "Nonna's schedule for the week"
  week_days               = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
}

resource "azurerm_automation_runbook" "rb-fitness" {
  name                    = "nonnascript"
  location                = azurerm_resource_group.nonna-rg.location
  resource_group_name     = azurerm_resource_group.nonna-rg.name
  automation_account_name = azurerm_automation_account.nonna-autoacc.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "Fitness Runbook main script"
  runbook_type            = "PowerShellWorkflow"

  content = data.local_file.nonna-script.content
}

resource "azurerm_automation_schedule" "nonna-schedule" {
  name                    = "nonnaschedule"
  resource_group_name     = azurerm_resource_group.nonna-rg.name
  automation_account_name = azurerm_automation_account.nonna-autoacc.name
  frequency               = "Week"
  interval                = 1
  timezone                = "Europe/London"
  start_time              = "2024-05-20T18:08:00+00:00"
  description             = "Weekly schedule for the Fitness runbook"
  week_days               = ["Tuesday", "Thursday", ]
}