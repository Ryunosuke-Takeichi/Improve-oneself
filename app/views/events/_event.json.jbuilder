json.extract! event, :id, :title, :body, :start_date, :end_date, :created_at, :updated_at
json.url user_event_url(vent, format: :json)
