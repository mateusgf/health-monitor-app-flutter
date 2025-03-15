resource "random_password" "postgres_admin_password" {
  length           = 16
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 2
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  override_special = "!@#$%"
}

data "azurerm_key_vault_secret" "postgres_admin_password" {
  name         = "tf-managed-db-admin-password"
  key_vault_id = var.key_vault_id
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "bhealth-postgres"
  resource_group_name    = var.resource_group_name
  location               = var.location
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  administrator_login    = "adminuser"
  administrator_password = random_password.postgres_admin_password.result
  version                = "16"
  zone                   = 1

  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = var.postgres_dns_zone_id

  public_network_access_enabled = false
}

resource "azurerm_postgresql_flexible_server_configuration" "postgres" {
  name      = "azure.extensions"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  value     = "btree_gist,uuid-ossp,plpgsql,postgis"
}

resource "azurerm_postgresql_flexible_server_database" "main" {
  name      = "bhealth_db"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
