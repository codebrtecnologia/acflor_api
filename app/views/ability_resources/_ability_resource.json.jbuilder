json.merge! ability_resource.attributes
json.url ability_resource_url(ability_resource, format: :json)

ability_actions = ability_resource.ability_actions
json.ability_actions ability_actions do |ability_action|
  json.id ability_action.id
  json.name ability_action.name
end
