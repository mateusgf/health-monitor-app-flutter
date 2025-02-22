output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}

output "postgres_subnet_id" {
  value = azurerm_subnet.postgres_subnet.id
}

output "postgres_dns_zone_id" {
  value = azurerm_private_dns_zone.postgres.id
}
