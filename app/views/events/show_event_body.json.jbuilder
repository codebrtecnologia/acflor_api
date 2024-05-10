json.event_body do
  json.id @event_body.id
  json.public_body do
    json.id @event_body.public_body.id
    json.name @event_body.public_body.name
  end
end