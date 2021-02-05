variable "rg" {
    default = "terraform-lab1"
}

variable "app_prefix" {
  default=""
}
variable "loc" {
    default = "AustraliaEast"
}

variable "tags" {
    type = map
    default = {
        environment = "training"
        source      = "citadel1"
    }
}
variable "locations" {
  default=["AustraliaEast","japanwest"]
}