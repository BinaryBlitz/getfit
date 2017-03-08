json.cache! [user, 'preview'] do
  json.extract! user, :id, :first_name, :last_name, :avatar_url
end
