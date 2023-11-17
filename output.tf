output "id" {
  value = azurerm_app_service_plan.app_service_plan.id
}

output "maximum_number_of_workers" {
  description = "maximum number of workers"
  value       = azurerm_app_service_plan.app_service_plan.maximum_number_of_workers
}