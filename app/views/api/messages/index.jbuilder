json.array! @messages do |message|
  json.extract! message, :id, :content, :category, :image_url, :created_at, :updated_at
end
