json.public_bodies @public_bodies do |public_body|
  json.id public_body.id
  json.name public_body.name
end

json.total @public_bodies_before_paginate
json.current_page @page_no