json.extract! question, :id, :body, :state, :created_at, :updated_at
json.url question_url(question, format: :json)