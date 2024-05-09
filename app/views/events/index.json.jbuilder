json.events @events do |event|
  json.id event.id
  json.name event.name
  json.initial_date event.initial_date
  json.final_date event.final_date
  json.user do
    json.id event.user.id
    json.name event.user.name
  end
  json.active event.active
end

json.total @events_before_paginate
json.current_page @page_no