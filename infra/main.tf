data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  environment         = var.environment
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}

module "database" {
  source               = "./modules/database"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  vnet_id              = module.networking.vnet_id
  subnet_id            = module.networking.postgres_subnet_id
  key_vault_id         = module.keyvault.key_vault_id
  postgres_dns_zone_id = module.networking.postgres_dns_zone_id
  depends_on           = [module.networking, module.keyvault]
}

module "database_keyvault" {
  source                  = "./modules/database_keyvault"
  server_fqdn             = module.database.server_fqdn
  database_admin_user     = module.database.database_admin_user
  postgres_admin_password = module.database.postgres_admin_password
  database_name           = module.database.database_name
  key_vault_id            = module.keyvault.key_vault_id

  depends_on = [module.database, module.keyvault]
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.networking.aks_subnet_id
  acr_id              = module.acr.acr_id
  key_vault_id         = module.keyvault.key_vault_id
  keyvault_name       = module.keyvault.keyvault_name
  tenant_id            = data.azurerm_client_config.current.tenant_id
  depends_on          = [module.networking, module.acr, module.keyvault]

  providers = {
    kubernetes = kubernetes
    kubectl    = kubectl
    helm       = helm
  }
}
