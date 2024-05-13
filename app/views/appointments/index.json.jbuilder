json.appointments @appointments do |appointment|
  json.id appointment.id
  json.title appointment.title
  json.local appointment.local
  json.situation appointment.decorate.situation_i18n
  json.repetition appointment.decorate.repetition_i18n
  json.local appointment.local
  json.initial_date appointment.initial_date
  json.final_date appointment.final_date
end

json.total @appointments_before_paginate
json.current_page @page_no