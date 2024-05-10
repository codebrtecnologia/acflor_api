json.events_attendances @events_attendances do |events_attendance|
  json.id events_attendance.id
  json.person do
    json.id events_attendance.person.id
    json.name events_attendance.person.name
  end
  json.confirmed_presence events_attendance.confirmed_presence
  json.confirmation_date events_attendance.confirmation_date
end

json.total @events_attendances_before_paginate
json.current_page @page_no