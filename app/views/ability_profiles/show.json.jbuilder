json.id @ability_profiles.id
json.name @ability_profiles.name

actions_by_resource = @ability_profiles.ability_permissions.each_with_object({}) do |ability_permission, hash|
  resource = ability_permission.ability_action.ability_resource
  resource_id = resource.id
  resource_name = I18n.t("activerecord.models.#{resource.name}")

  hash[resource_id] ||= { resource_id: resource_id, resource_name: resource_name, actions: [] }
  hash[resource_id][:actions] << {
    id: ability_permission.ability_action.id,
    name: I18n.t("ability_permission.action_code.#{ability_permission.ability_action.name}")
  }
end

json.permissions do
  actions_by_resource.each do |_, resource_data|
    json.child! do
      json.resource_id resource_data[:resource_id]
      json.resource_name resource_data[:resource_name]
      json.actions resource_data[:actions]
    end
  end
end
