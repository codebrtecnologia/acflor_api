json.entity_address do
  json.id @entity_addresses.id
  json.street @entity_addresses.street
  json.neighborhood @entity_addresses.neighborhood
  json.city @entity_addresses.city
  json.zip_code @entity_addresses.zip_code
  json.entity_id @entity_addresses.entity.name
end
