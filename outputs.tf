output "webappsname" {
  description = "site names."
  value       = "${azurerm_app_service.citadel.*.default_site_hostname}"
}