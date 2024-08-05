json.user_address do
  json.id @user_addresses.id
  json.street @user_addresses.street
  json.neighborhood @user_addresses.neighborhood
  json.city @user_addresses.city
  json.zip_code @user_addresses.zip_code
  json.user_id @user_addresses.user.email
end
