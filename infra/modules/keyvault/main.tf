resource "azurerm_key_vault" "main" {
  name                       = "bhealth-vault-tf-managed"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku_name                   = "standard"
  tenant_id                  = var.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

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
