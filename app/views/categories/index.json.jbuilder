json.categories @categories do |category|
  json.id category.id
  json.name category.name
end

json.total @categories_before_paginate
json.current_page @page_no