variable "enable_logs" {
  description = "Enable Azure Monitor diagnostics."
  type        = bool
  default     = true
}

variable "enable_sp" {
  description = "Enable access using Service Principal."
  type        = bool
  default     = false
}

variable "tags" {
  description = "List of tags."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Resource name prefix."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "rg_name" {
  description = "The name of an existing resource group to create the resource in."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace id."
  type        = string
  default     = ""
}

variable "account_kind" {
  description = "The Storage Account kind."
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "The Storage Account Tier."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}

variable "service_principal_id" {
  description = "Service Principal ID allowed to access the storage account."
  type        = string
  default     = ""
}

variable "sa_roles" {
  description = "Storage Account roles to be assigned to the Service Principal."
  type        = list(string)
  default = [
    "Storage Blob Data Contributor",
    "Storage Blob Data Reader",
    "Storage Account Contributor",
  ]
}

variable "enable_shared_access_key" {
  description = "Enable or disable shared access keys for the storage account."
  type        = bool
  default     = true
}
