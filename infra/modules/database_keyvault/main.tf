resource "azurerm_key_vault_secret" "postgres_admin_password" {
  name         = "tf-generated-db-admin-password"
  value        = var.postgres_admin_password
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "db_host" {
  name         = "tf-generated-db-host"
  value        = var.server_fqdn
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "db_user" {
  name         = "tf-generated-db-user"
  value        = var.database_admin_user
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "db_name" {
  name         = "tf-generated-db-name"
  value        = var.database_name
  key_vault_id = var.key_vault_id
}