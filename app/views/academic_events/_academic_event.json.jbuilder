json.extract! academic_event, :id, :name, :description, :start_date, :end_date, :start_time, :end_time, :local, :created_at, :updated_at
json.url academic_event_url(academic_event, format: :json)
