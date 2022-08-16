

module "iot_hubs" {
  source     = "./modules/iot_hub/"
  #depends_on = [module.event_hub_namespaces]
  for_each   = try(var.iot.iot_hubs, {})

  client_config      = local.client_config
  global_settings    = local.global_settings
  settings           = each.value
  #namespace_name     = module.event_hub_namespaces[each.value.event_hub_namespace_key].name
  #storage_account_id = try(module.storage_accounts[each.value.storage_account_key].id, null)
  location            = can(local.global_settings.regions[each.value.region]) ? local.global_settings.regions[each.value.region] : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group.key, each.value.resource_group_key)].location
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  base_tags           = try(local.global_settings.inherit_tags, false) ? try(local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group.key, each.value.resource_group_key)].tags, {}) : {}

}

# module "event_hub_auth_rules" {
#   source   = "./modules/event_hubs/hubs/auth_rules"
#   for_each = try(var.event_hub_auth_rules, {})

#   client_config   = local.client_config
#   global_settings = local.global_settings
#   settings        = each.value
#   namespace_name  = module.event_hub_namespaces[each.value.event_hub_namespace_key].name
#   eventhub_name   = module.event_hubs[each.value.event_hub_name_key].name
#   resource_group  = local.combined_objects_resource_groups[try(each.value.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)]


#   depends_on = [
#     module.event_hub_namespaces,
#     module.event_hubs
#   ]
# }

# output "event_hub_auth_rules" {
#   value = module.event_hub_auth_rules
# }

# module "event_hub_consumer_groups" {
#   source   = "./modules/event_hubs/consumer_groups"
#   for_each = try(var.event_hub_consumer_groups, {})

#   client_config   = local.client_config
#   global_settings = local.global_settings
#   settings        = each.value
#   namespace_name  = module.event_hub_namespaces[each.value.event_hub_namespace_key].name
#   eventhub_name   = module.event_hubs[each.value.event_hub_name_key].name
#   resource_group  = local.combined_objects_resource_groups[try(each.value.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)]


#   depends_on = [
#     module.event_hub_namespaces,
#     module.event_hubs
#   ]
# }
