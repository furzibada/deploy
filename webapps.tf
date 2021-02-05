locals {
    app_regions     = [ "eastus2", "uksouth", "centralindia" ]
    default_prefix  = "webapp-${var.tags["environment"]}"
    app_prefix      = "${var.app_prefix != "" ? var.app_prefix : local.default_prefix}"
}

resource "azurerm_app_service_plan" "free" {
    count               = length(local.app_regions)
    name                = "plan-free-${local.app_regions[count.index]}"
    location            = local.app_regions[count.index]
    resource_group_name = azurerm_resource_group.webapps.name
    tags                = azurerm_resource_group.webapps.tags
    kind                = "Linux"
    reserved            = true
    sku {
        tier = "Free"
        size = "F1"
    }
}

resource "azurerm_app_service" "citadel" {
    count =length(local.app_regions)
    name                = "${format("%s-%s-%s", local.app_prefix, random_string.webapprnd.result, local.app_regions[count.index])}"
    location            = local.app_regions[count.index]
    resource_group_name = azurerm_resource_group.webapps.name
    tags                = azurerm_resource_group.webapps.tags
    app_service_plan_id = element(azurerm_app_service_plan.free.*.id, count.index)
}