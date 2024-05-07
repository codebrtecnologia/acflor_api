json.cities @cities do |city|
  json.id city.id
  json.name city.name
end

json.total @cities_before_paginate
json.current_page @page_no