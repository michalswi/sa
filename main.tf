locals {
  enable_logs = var.enable_logs

  tags                       = var.tags
  name                       = var.name
  location                   = var.location
  rg_name                    = var.rg_name
  log_analytics_workspace_id = var.log_analytics_workspace_id

  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 3
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = local.enable_logs == "true" ? 1 : 0

  name                       = "${local.name}-diag"
  target_resource_id         = azurerm_storage_account.this.id
  log_analytics_workspace_id = local.log_analytics_workspace_id

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

resource "azurerm_storage_account" "this" {
  name                = "${local.name}${random_id.log_analytics_workspace_name_suffix.hex}"
  resource_group_name = local.rg_name
  location            = local.location

  account_kind             = local.account_kind
  account_tier             = local.account_tier
  account_replication_type = local.account_replication_type

  # todo
  # network_rules {
  #   default_action             = "Deny"
  #   bypass                     = ["AzureServices", "Metrics", "Logging"]
  #   virtual_network_subnet_ids = []
  #   ip_rules                   = ""
  # }

  tags = local.tags
}

# resource "azurerm_management_lock" "this" {
#   name       = "sa-lock"
#   scope      = azurerm_storage_account.this.id
#   lock_level = "CanNotDelete"
#   notes      = "Storage Account Lock"
# }
