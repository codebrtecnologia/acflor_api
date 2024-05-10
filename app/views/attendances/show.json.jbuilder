json.attendances do
  json.id @attendances.id
  json.event do
    json.id @attendances.event.id
    json.name @attendances.event.name
    json.position @attendances.event.position
    json.email @attendances.event.email
    json.active @attendances.event.active
  end
  json.person do
    json.id @attendances.person.id
    json.name @attendances.person.name
    json.position @attendances.person.position
    json.email @attendances.person.email
    json.active @attendances.person.active
  end
  json.confirmed_presence @attendances.confirmed_presence
  json.confirmation_date @attendances.confirmation_date
  json.attended_the_event @attendances.attended_the_event
  json.role @attendances.role
  json.observations @attendances.observations
end