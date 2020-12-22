json.extract! video, :id, :titulo, :rating, :created_at, :updated_at
json.url video_url(video, format: :json)
