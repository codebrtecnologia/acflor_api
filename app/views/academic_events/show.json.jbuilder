json.academic_event do
  json.id @academic_events.id
  json.name @academic_events.name
  json.description @academic_events.description
  json.start_date @academic_events.start_date
  json.end_date @academic_events.end_date
  json.start_time @academic_events.end_date
  json.end_time @academic_events.end_time
  json.local @academic_events.local
end