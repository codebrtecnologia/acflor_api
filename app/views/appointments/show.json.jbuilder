json.appointments do
  json.id @appointments.id
  json.title @appointments.title
  json.local @appointments.local
  json.situation @appointments.decorate.situation_i18n
  json.repetition @appointments.decorate.repetition_i18n
  json.local @appointments.local
  json.initial_date @appointments.initial_date
  json.final_date @appointments.final_date
  json.user do
    json.id @appointments.user.id
    json.name @appointments.user.name
  end
  json.city do
    json.id @appointments.city.id
    json.name @appointments.city.name
  end
  json.person do
    json.id @appointments.person.id
    json.name @appointments.person.name
  end
  json.observations @appointments.observations
end