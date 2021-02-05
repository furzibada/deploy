
resource "azurerm_resource_group" "webapps" {
  name     = "sa${var.loc}${random_string.webapprnd.result}"
  location = var.loc
  tags = var.tags
}
