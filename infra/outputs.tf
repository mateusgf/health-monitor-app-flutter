output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "postgres_server" {
  value = module.database.server_fqdn
}

output "aks_fqdn" {
  value = module.aks.cluster_fqdn
}

output "get_credentials_command" {
  value = "az aks get-credentials --resource-group ${azurerm_resource_group.main.name} --name ${module.aks.cluster_name}"
}

output "kube-tunnel" {
  value = "kube-tunnel -context ${module.aks.cluster_name} ${module.database.server_fqdn} 5432 14000"
}
