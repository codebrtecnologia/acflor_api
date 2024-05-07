json.merge! ability_permission.attributes
json.url ability_permission_url(ability_permission, format: :json)

json.ability_profile do
  json.id ability_permission.ability_profile.id
  json.name ability_permission.ability_profile.name
end

json.ability_action do
  json.id ability_permission.ability_action.id
  json.name ability_permission.ability_action.name
end