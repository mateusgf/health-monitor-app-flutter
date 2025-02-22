variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_id" {
  description = "Virtual network ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for PostgreSQL"
  type        = string
}

variable "key_vault_id" {
  description = "Key vault ID"
  type        = string
}

variable "postgres_dns_zone_id" {
  description = "Private DNS zone ID for PostgreSQL"
  type        = string
}
