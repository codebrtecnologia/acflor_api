json.holidays @holidays do |holiday|
  json.id holiday.id
  json.description holiday.description
  json.date holiday.date
  json.type holiday.decorate.holiday_type_i18n
end

json.total @holidays_before_paginate
json.current_page @page_no