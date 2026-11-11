resource "azurerm_resource_group" "this" {
  name     = "rg-devsu-demo"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "aks-devsu-demo"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "devsu-demo"
  sku_tier            = "Free"

  default_node_pool {
    name       = "system"
    vm_size    = var.node_vm_size
    node_count = var.node_count
  }

  identity {
    type = "SystemAssigned"
  }
}
