json.entity_addresses @entity_addresses do |entity_address|
  json.id entity_address.id
  json.street entity_address.street
  json.neighborhood entity_address.neighborhood
  json.city entity_address.city
  json.zip_code entity_address.zip_code
  json.entity_id entity_address.entity.name
end
