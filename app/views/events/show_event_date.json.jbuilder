json.event_body do
  json.id @event_date.id
  json.date @event_date.date.strftime("%d/%m/%Y")
  json.start_time @event_date.start_time.strftime("%H:%M:%S")
  json.end_time @event_date.end_time.strftime("%H:%M:%S")
end