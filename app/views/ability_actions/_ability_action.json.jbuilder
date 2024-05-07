json.merge! ability_action.attributes
json.url ability_action_url(ability_action, format: :json)

ability_resource = ability_action.ability_resource
json.ability_resource do
  json.id ability_resource.id
  json.name ability_resource.name
end
