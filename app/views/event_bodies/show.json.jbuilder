json.event_bodies do
  json.id @event_bodies.id
  json.event do
    json.id @event_bodies.event.id
    json.name @event_bodies.event.name
    json.initial_date @event_bodies.event.initial_date
    json.final_date @event_bodies.event.final_date
  end
  json.public_body do
    json.id @event_bodies.public_body.id
    json.name @event_bodies.public_body.name
  end
  json.confirmed_presence @event_bodies.confirmed_presence
  json.confirmation_date @event_bodies.confirmation_date
  json.attended_the_event @event_bodies.attended_the_event
  json.role @event_bodies.role
  json.observations @event_bodies.observations
end