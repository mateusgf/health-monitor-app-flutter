output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "cluster_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0]
  sensitive = true
}

output "client_id" {
  value = azurerm_user_assigned_identity.aks_identity.client_id
}

output "principal_id" {
  value = azurerm_user_assigned_identity.aks_identity.principal_id
}