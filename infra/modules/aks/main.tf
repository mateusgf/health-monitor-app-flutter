terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

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
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_identity.id]
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  # Enable OIDC & Workload Identity (needed for Key Vault access)
  oidc_issuer_enabled       = true
  workload_identity_enabled = true
}

# Create a managed identity for AKS to access Key Vault
resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "bhealth-aks-identity"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "aks_acr" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope               = var.acr_id
}

# Assign Key Vault Reader Role to AKS
resource "azurerm_role_assignment" "aks_keyvault_reader" {
  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
  role_definition_name = "Reader"
  scope               = var.key_vault_id
}

# Assign Key Vault Secrets User Role to AKS
resource "azurerm_role_assignment" "aks_keyvault_secrets" {
  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
  role_definition_name = "Key Vault Secrets User"
  scope               = var.key_vault_id
}

resource "null_resource" "wait_for_aks" {
  depends_on = [azurerm_kubernetes_cluster.aks]

  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${var.resource_group_name} --name ${azurerm_kubernetes_cluster.aks.name} --overwrite-existing && sleep 30"
  }
}

resource "helm_release" "secrets_store_csi_driver" {
  depends_on = [
    azurerm_kubernetes_cluster.aks,
    null_resource.wait_for_aks
  ]

  name       = "csi-secrets-store"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"
  namespace  = "kube-system"
  version    = "1.4.3"

  set {
    name  = "syncSecrets.enabled"
    value = "true"
  }

  set {
    name  = "enableSecretRotation"
    value = "true"
  }

  set {
    name  = "linux.enabled"
    value = "true"
  }

  set {
    name  = "linux.providers.azure.enabled"
    value = "true"
  }

  set {
    name  = "secrets-store-csi-driver-provider-azure.install"
    value = "true"
  }
}

resource "kubectl_manifest" "secrets_store_csi_driver" {
  depends_on = [
    azurerm_kubernetes_cluster.aks,
    null_resource.wait_for_aks,
    helm_release.secrets_store_csi_driver
  ]

  yaml_body = templatefile("${path.module}/manifests/SecretProviderClass.yaml", {
    user_assigned_identity_id = azurerm_user_assigned_identity.aks_identity.client_id
    keyvault_name             = var.keyvault_name
    tenant_id                 = var.tenant_id
  })
}

resource "kubernetes_service_account" "golang_backend_sa" {
  depends_on = [
    azurerm_kubernetes_cluster.aks,
    null_resource.wait_for_aks
  ]

  metadata {
    name      = "golang-backend-sa"
    namespace = "default"
    annotations = {
      "azure.workload.identity/client-id" = azurerm_user_assigned_identity.aks_identity.client_id
    }
  }
}
