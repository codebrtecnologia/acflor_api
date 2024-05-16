json.user do
  json.id @users.id
  json.name @users.name
  json.email @users.email
  json.provider @users.provider
  json.uid @users.uid
  json.ability_profile do
    json.id @users&.ability_profile&.id
    json.name @users&.ability_profile&.name
  end
end
