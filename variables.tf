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
  default     = "Standard"
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
  description = "Service Principal ID allowed to access the Storage Account."
  type        = string
  default     = ""
}
