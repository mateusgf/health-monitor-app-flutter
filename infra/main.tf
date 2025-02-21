terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">=4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3"
}

data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}
  # az account show --query "{subscriptionId:id, tenantId:tenantId}" -o json
  subscription_id = data.azurerm_client_config.current.subscription_id
}

provider "google" {
  credentials = file("firebase-service-account.json")
  project     = "health-monitor-app-18786"
}

provider "random" {}

resource "random_password" "db_password" {
  length           = 16    # Length of the password
  special          = true  # Include special characters
  upper            = true  # Include uppercase letters
  lower            = true  # Include lowercase letters
  numeric          = true  # Include numbers
  min_special      = 2     # Minimum number of special characters
  min_upper        = 2     # Minimum number of uppercase letters
  min_lower        = 2     # Minimum number of lowercase letters
  min_numeric      = 2     # Minimum number of numbers
  override_special = "!@#$%"  # Optional: Define allowed special characters
}

resource "azurerm_resource_group" "main" {
  name     = "health-app-monitor-common"
  location = "East US 2"
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "health-app-monitor-aks-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.main.name
  address_prefixes     = ["10.240.0.0/16"]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "health-app-monitor-aks-cluster"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "health-app-monitor-aks"

  default_node_pool {
    name           = "default"
    node_count     = 2
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  network_profile {
    network_plugin    = "azure"
    dns_service_ip    = "10.0.0.10"
    service_cidr      = "10.0.0.0/16"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_key_vault" "vault" {
  name                = "health-monitor-app-dev"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id # identity or SP

    key_permissions = [
      "Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Recover", "Purge"
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Backup", "Restore", "Recover", "Purge"
    ]

    certificate_permissions = [
      "Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Recover", "Purge"
    ]
  }
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = "db-password"
  value        = random_password.db_password.result
  key_vault_id = azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "db_password" {
  name         = "db-password"
  key_vault_id = azurerm_key_vault.vault.id
  depends_on   = [azurerm_key_vault_secret.db_password]
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "health"
  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location 
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  administrator_login    = "adminuser"
  administrator_password = data.azurerm_key_vault_secret.db_password.value
  version                = "16"
  zone                   = 1

  delegated_subnet_id    = azurerm_subnet.postgresflexibleserversubnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.postgres.id

  public_network_access_enabled = false
}

resource "azurerm_postgresql_flexible_server_configuration" "postgres" {
  name      = "azure.extensions"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  value     = "BTREE_GIST,UUID-OSSP"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "health-app-monitor-vnet"
  location            = "East US 2"
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_postgresql_flexible_server_database" "health_database" {
  name      = "health_database"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}


resource "azurerm_private_dns_zone" "postgres" {

  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres-private-dns-zone-link" {

  name                  = "postgres-private-dns"
  resource_group_name   = azurerm_resource_group.main.name
  private_dns_zone_name = azurerm_private_dns_zone.postgres.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

resource "azurerm_subnet" "postgresflexibleserversubnet" {
  name                                      = "health-app-monitor-postgresflexibleserversubnet"
  virtual_network_name                      = azurerm_virtual_network.vnet.name
  resource_group_name                       = azurerm_resource_group.main.name
  address_prefixes                          = ["10.239.255.0/24"]

  # private_endpoint_network_policies_enabled = false

  delegation {
    name = "postgresql-delegation"

    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}


# Firebase Authentication Setup (Placeholder - needs additional Firebase resources)
/*resource "google_identity_platform_tenant" "firebase_auth" {
  display_name = "My Firebase Auth Tenant"
}*/

/*resource "google_identity_platform_tenant_oauth_idp_config" "google_auth" {
  tenant         = google_identity_platform_tenant.firebase_auth.name
  display_name   = "Google OAuth"
  enabled        = true
  client_id      = "your-client-id"
  client_secret  = "your-client-secret"
}*/

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "postgres_server" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "get_credentials_command" {
  value = "az aks get-credentials --resource-group ${azurerm_resource_group.main.name} --name ${azurerm_kubernetes_cluster.aks.name}"
}

output "kube-tunnel" {
  value = "kube-tunnel -context ${azurerm_kubernetes_cluster.aks.name} ${azurerm_postgresql_flexible_server.postgres.fqdn} 5432 14000"
}
