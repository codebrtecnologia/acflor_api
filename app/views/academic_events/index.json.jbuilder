json.academic_events @academic_events do |academic_event|
  json.id academic_event.id
  json.name academic_event.name
  json.description academic_event.description
  json.start_date academic_event.start_date
  json.end_date academic_event.end_date
  json.start_time academic_event.start_time
  json.end_time academic_event.end_time
  json.local academic_event.local
end