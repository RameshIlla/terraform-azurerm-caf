variable "global_settings" {}
variable "settings" {}
variable "resource_group_name" {
  description = "Resource group objects."
}
variable "base_tags" {}
variable "client_config" {}
# variable "namespace_name" {
#   description = "Name of the IOT Hub Namespace."
#   type        = string
# }
variable "location" {
  description = "(Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}
# variable "storage_account_id" {
#   description = "Identifier of the storage account ID to be used."
#   type        = string
# }
