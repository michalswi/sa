variable "tags" {
  description = "List of tags."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Resource name prefix."
  type        = string
  default     = "oneadkv"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "rg_name" {
  description = "The name of an existing resource group to create the resource in."
  type        = string
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace id."
  type        = string
  default     = ""
}

variable "sa_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default     = "Standard"
}

variable "sa_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}
