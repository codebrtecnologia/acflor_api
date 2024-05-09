json.agenda_requests @agenda_requests do |agenda_request|
  json.id agenda_request.id
  json.email agenda_request.email
  json.subject agenda_request.subject
  json.status agenda_request.decorate.status_i18n
  json.requester do
    json.id agenda_request.requester.id
    json.name agenda_request.requester.name
    json.position agenda_request.requester.position
    json.email agenda_request.requester.email
  end
  json.requested do
    json.id agenda_request.requested.id
    json.name agenda_request.requested.name
    json.position agenda_request.requested.position
    json.email agenda_request.requested.email
  end
end

json.total @agenda_requests_before_paginate
json.current_page @page_no