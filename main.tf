resource "azurerm_service_plan" "service_plan" {
  name                         = var.name
  location                     = var.location
  os_type                      = var.os_type
  resource_group_name          = var.resource_group_name
  sku_name                     = var.sku_name
  app_service_environment_id   = var.app_service_environment_id
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  worker_count                 = var.worker_count
  per_site_scaling_enabled     = var.per_site_scaling_enabled
  zone_balancing_enabled       = var.zone_balancing_enabled
  tags                         = local.tags
  lifecycle {
    ignore_changes = [
      tags["create_date"]
    ]
  }
}

resource "azurerm_role_assignment" "service_plan_reader" {
  depends_on = [azurerm_service_plan.service_plan]
  for_each = {
    for group in var.azure_ad_groups : group => group
    if var.azure_ad_groups != []
  }
  scope                = azurerm_service_plan.service_plan.id
  role_definition_name = "Reader"
  principal_id         = each.value
}