json.agenda_requests do
  json.id @agenda_requests.id
  json.cellphone_number @agenda_requests.cellphone_number
  json.email @agenda_requests.email
  json.local @agenda_requests.local
  json.subject @agenda_requests.subject
  json.observations @agenda_requests.observations
  json.infos @agenda_requests.infos
  json.city do
    json.id @agenda_requests&.city&.id
    json.name @agenda_requests&.city&.name
  end
  json.requester do
    json.id @agenda_requests.requester.id
    json.name @agenda_requests.requester.name
    json.position @agenda_requests.requester.position
    json.email @agenda_requests.requester.email
  end
  json.requested do
    json.id @agenda_requests.requested.id
    json.name @agenda_requests.requested.name
    json.position @agenda_requests.requested.position
    json.email @agenda_requests.requested.email
  end
  json.requesting_user do
    json.id @agenda_requests.requesting_user.id
    json.name @agenda_requests.requesting_user.name
    json.email @agenda_requests.requesting_user.email
  end
  json.approving_user do
    json.id @agenda_requests&.approving_user&.id
    json.name @agenda_requests&.approving_user&.name
    json.email @agenda_requests&.approving_user&.email
  end
  json.status @agenda_requests.decorate.status_i18n
  json.approval_date @agenda_requests.approval_date
end
