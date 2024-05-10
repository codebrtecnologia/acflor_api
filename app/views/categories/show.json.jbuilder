json.events_attendance do
  json.id @events_attendance.id
  json.person do
    json.id @events_attendance.person.id
    json.name @events_attendance.person.name
    json.position @events_attendance.person.position
    json.email @events_attendance.person.email
    json.active @events_attendance.person.active
  end
  json.confirmed_presence @events_attendance.confirmed_presence
  json.confirmation_date @events_attendance.confirmation_date
  json.attended_the_event @events_attendance.attended_the_event
  json.role @events_attendance.role
  json.observations @events_attendance.observations
end