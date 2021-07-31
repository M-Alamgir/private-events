json.extract! event, :id, :time, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
