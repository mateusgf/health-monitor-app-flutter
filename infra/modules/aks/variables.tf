variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for AKS"
  type        = string
}

variable "acr_id" {
  description = "ACR ID for AKS"
  type        = string
}

variable "key_vault_id" {
  description = "Key vault ID for AKS"
  type        = string
}

variable "keyvault_name" {
  description = "Key vault name for AKS"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID name for AKS"
  type        = string
}
