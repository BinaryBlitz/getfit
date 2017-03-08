json.cache! post do
  json.extract! post, :id, :content, :image_url, :created_at, :updated_at, :comments_count
end
