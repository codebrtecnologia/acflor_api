json.events do
  json.id @events.id
  json.name @events.name
  json.observations @events.observations
  json.infos @events.infos
  json.local @events.local
  json.dates do
    @event.event_dates.each do |event_date|
      json.child! do
        json.event_id @event.id
        json.date event_date.date.strftime("%d/%m/%Y")
        json.start_time event_date.start_time.strftime("%H:%M:%S")
        json.end_time event_date.end_time.strftime("%H:%M:%S")
      end
    end
  end
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
