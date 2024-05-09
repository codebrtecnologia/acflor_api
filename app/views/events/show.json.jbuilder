json.events do
  json.id @events.id
  json.name @events.name
  json.initial_date @events.initial_date
  json.final_date @events.final_date
  json.observations @events.observations
  json.infos @events.infos
  json.local @events.local
  json.city do
    json.id @events&.city&.id
    json.name @events&.city&.name
  end
  json.agenda_request do
    json.id @events&.agenda_request&.id
    json.email @events&.agenda_request&.email
    json.local @events&.agenda_request&.local
    json.subject @events&.agenda_request&.subject
  end
  json.user do
    json.id @events.user.id
    json.name @events.user.name
  end
  json.active @events.active
end
