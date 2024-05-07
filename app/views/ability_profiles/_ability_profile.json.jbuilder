json.merge! ability_profile.attributes
json.url ability_profile_url(ability_profile, format: :json)

ability_permissions = ability_profile.ability_permissions
json.ability_permissions ability_permissions do |ability_permission|
  ability_action = ability_permission.ability_action

  json.id ability_action.id
  json.name ability_action.name

  ability_resource = ability_action.ability_resource
  json.ability_resource do
    json.id ability_resource.id
    json.name ability_resource.name
  end
end
