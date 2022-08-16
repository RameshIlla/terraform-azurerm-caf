# Need to implement the CAF naming convention provider for iot_hub

resource "azurerm_iothub" "iot_hub" {
  name                        = var.settings.name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  #namespace_name              = var.namespace_name
  #sku                         = try(var.settings.sku, null)
  #event_hub_partition_count   = try(var.settings.event_hub_partition_count, null)
  #event_hub_retention_in_days = try(var.settings.event_hub_retention_in_days, null)
  endpoint                    = try(var.settings.endpoint, null)
  #fall_back_route             = try(var.settings.fall_back_route, null)
  #file_upload                 = try(var.settings.file_upload, null)
  #identity                    = try(var.settings.identity, null)
  #network_rule_set            = try(var.settings.network_rule_set, null)
  #cloud_to_device             = try(var.settings.cloud_to_device, null)
  public_network_access_enabled = try(var.settings.public_network_access_enabled, null)
  min_tls_version             = try(var.settings.min_tls_version, 1.2)
  tags                        = try(var.settings.identity, null)
  sku {
    name     = var.settings.sku.name
    capacity = var.settings.sku.capacity
  }

}