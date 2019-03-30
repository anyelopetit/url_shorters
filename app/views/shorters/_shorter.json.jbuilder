json.extract! shorter, :id, :original_url, :shorted_url, :expire_time, :redirect_counter, :created_at, :updated_at
json.url shorter_url(shorter, format: :json)
