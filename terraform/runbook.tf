resource "azurerm_automation_account" "louautoaccount" {
    name = "autoacc-lou"
    location = azurerm_resource_group.nonna-rg.location
    resource_group_name = azurerm_resource_group.nonna-rg.name
    sku_name = "basic"
}

resource "azurerm_automation_runbook" "nonna" {
  name = "nonna"
  location = azurerm_resource_group.nonna-rg.location
  resource_group_name = azurerm_resource_group.nonna-rg.name
  automation_account_name = azurerm_automation_account.louautoaccount.name
  log_verbose = "true"
  log_progress = "true"
  description = "Nonna main Script"
  runbook_type = "PowershellWorkflow"

  publish_content_link {
    uri = "https://github.com/louisruocco/Nonna/blob/master/Scripts/script.ps1"
  }
}

resource "azurerm_automation_schedule" "nonna-schedule" {
  name                    = "nonna_schedule"
  resource_group_name     = azurerm_resource_group.nonna-rg.name
  automation_account_name = azurerm_automation_account.louautoaccount.name
  frequency               = "Week"
  interval                = 1
  timezone                = "Europe/London"
  start_time              = "2014-04-20T08:00:00"
  description             = "This is the schedule for the main Nonna script"
  week_days               = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
}