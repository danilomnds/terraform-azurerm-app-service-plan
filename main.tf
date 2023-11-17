resource "azurerm_app_service_plan" "app_service_plan" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  kind = var.kind
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  dynamic "sku" {
    for_each = var.sku != null ? [var.sku] : []
    content {
      tier = sku.value.tier
      size = sku.value.size
      capacity = lookup(sku.value, "capacity", null)
  }
}
  app_service_environment_id = var.app_service_environment_id
  #reserved = var.reserved
  #per_site_scaling = var.per_site_scaling
  #is_xenon = var.is_xenon
  #zone_redundant = var.zone_redundant 
  tags    = local.tags
  lifecycle {
    ignore_changes = [
      tags["create_date"]
    ]
  }
}

resource "azurerm_role_assignment" "app_service_plan_reader" {
  depends_on = [azurerm_app_service_plan.app_service_plan]
  for_each = {
    for group in var.azure_ad_groups : group => group
    if var.azure_ad_groups != []
  }
  scope                = azurerm_app_service_plan.app_service_plan.id
  role_definition_name = "Reader"
  principal_id         = each.value
}