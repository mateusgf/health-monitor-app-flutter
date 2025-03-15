resource "azurerm_kubernetes_cluster" "aks" {
  name                = "bhealth-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "bhealth-aks"
  kubernetes_version  = "1.30.9"

  # Enables ACR authentication from AKS
  role_based_access_control_enabled = true

  default_node_pool {
    name           = "default"
    node_count     = 2
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = var.subnet_id
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "172.16.0.10"
    service_cidr   = "172.16.0.0/16"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "aks_acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name              = "AcrPull"
  scope                             = var.acr_id
}
