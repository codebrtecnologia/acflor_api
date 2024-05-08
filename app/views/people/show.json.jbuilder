json.people do
  json.id @people.id
  json.name @people.name
  json.position @people.position
  json.telephone @people.telephone
  json.cellphone_number @people.cellphone_number
  json.email @people.email
  json.alternative_email @people.alternative_email
  json.active @people.active
  json.category do
    json.id @people&.category&.id
    json.name @people&.category&.name
  end
  json.public_body do
    json.id @people&.public_body&.id
    json.name @people&.public_body&.name
  end
end