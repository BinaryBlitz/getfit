json.cache! message do
  json.extract! message, :id, :content, :image_url, :category, :created_at, :updated_at
end
