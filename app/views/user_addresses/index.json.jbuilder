json.user_addresses @user_addresses do |user_address|
  json.id user_address.id
  json.street user_address.street
  json.neighborhood user_address.neighborhood
  json.city user_address.city
  json.zip_code user_address.zip_code
  json.user_id user_address.user.email
end
