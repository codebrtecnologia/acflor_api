json.id user.id
json.uid user.uid
json.name user.name
json.email user.email
json.person_id user.person_id
json.url user_url(user, format: :json)
json.created_at user.created_at
json.updated_at user.updated_at

unless user.person.blank?
  person = user.person
  json.person do
    json.id person.id
    json.name person.name
  end
end
