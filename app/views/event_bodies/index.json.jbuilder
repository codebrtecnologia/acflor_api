json.event_bodies @event_bodies do |event_body|
  json.id event_body.id
  json.event do
    json.id event_body.event.id
    json.name event_body.event.name
  end
  json.public_body do
    json.id event_body.public_body.id
    json.name event_body.public_body.name
  end
end

json.total @event_bodies_before_paginate
json.current_page @page_no