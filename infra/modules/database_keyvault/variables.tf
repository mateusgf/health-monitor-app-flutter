variable "key_vault_id" {
  description = "Azure keyvault ID for database"
  type        = string
}

variable "server_fqdn" {
  description = "Postgres Server fqdn to be stored in the keyvault"
  type        = string
}

variable "database_admin_user" {
  description = "Postgres Server admin user to be stored in the keyvault"
  type        = string
}

variable "postgres_admin_password" {
  description = "Postgres Server admin password to be stored in the keyvault"
  type        = string
  sensitive = true

  validation {
    condition     = length(var.postgres_admin_password) >= 16
    error_message = "The postgres_admin_password must be at least 16 characters long."
  }
}

variable "database_name" {
  description = "Postgres DB name to be stored in the keyvault"
  type        = string
}
