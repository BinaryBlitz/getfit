json.extract! program,
              :id, :name, :preview, :description, :banner_url,
              :rating, :duration, :price, :workouts_count, :users_count

json.trainer do
  json.partial! 'api/trainers/trainer', trainer: program.trainer
end
