output "server_fqdn" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "database_name" {
  value = azurerm_postgresql_flexible_server_database.main.name
}

output "database_admin_user" {
  // @TODO this is being hardcoded in two different places. Put it in a variable and pass in to dependant modules instead
  value = "adminuser"
}

output "postgres_admin_password" {
  value = random_password.postgres_admin_password.result
  sensitive = true
}
