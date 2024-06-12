json.events @events do |event|
  json.id event.id
  json.name event.name
  json.dates do
    event.event_dates.each do |event_date|
      json.child! do
        json.event_id event.id
        json.date event_date.date.strftime("%d/%m/%Y")
        json.start_time event_date.start_time.strftime("%H:%M:%S")
        json.end_time event_date.end_time.strftime("%H:%M:%S")
      end
    end
  end
  json.user do
    json.id event.user.id
    json.name event.user.name
  end
  json.active event.active
end

json.total @events_before_paginate
json.current_page @page_no