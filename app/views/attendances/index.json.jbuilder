json.attendances @attendances do |attendance|
  json.id attendance.id
  json.event do
    json.id attendance.event.id
    json.name attendance.event.name
  end
  json.person do
    json.id attendance.person.id
    json.name attendance.person.name
  end
  json.confirmed_presence attendance.confirmed_presence
  json.confirmation_date attendance.confirmation_date
end

json.total @attendances_before_paginate
json.current_page @page_no