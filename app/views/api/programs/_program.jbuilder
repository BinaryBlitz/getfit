json.cache! program do
  json.extract! program,
                :id, :name, :preview, :description, :banner_url,
                :rating, :price, :workouts_count, :users_count
end
