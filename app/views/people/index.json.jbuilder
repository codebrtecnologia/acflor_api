json.people @people do |person|
  json.id person.id
  json.name person.name
  json.position person.position
  json.email person.email
  json.active person.active
end

json.total @people_before_paginate
json.current_page @page_no