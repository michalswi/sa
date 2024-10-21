locals {
  tags                       = var.tags
  name                       = var.name
  location                   = var.location
  rg_name                    = var.rg_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  sa_tier                    = var.sa_tier
  sa_replication_type        = var.sa_replication_type
}

resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 3
}

resource "azurerm_storage_account" "this" {
  name                     = "${local.name}${random_id.log_analytics_workspace_name_suffix.hex}"
  resource_group_name      = local.rg_name
  location                 = local.location
  account_tier             = local.sa_tier
  account_replication_type = local.sa_replication_type
  tags                     = local.tags
}

# resource "azurerm_management_lock" "this" {
#   name       = "sa-lock"
#   scope      = azurerm_storage_account.this.id
#   lock_level = "CanNotDelete"
#   notes      = "Storage Account Lock"
# }
