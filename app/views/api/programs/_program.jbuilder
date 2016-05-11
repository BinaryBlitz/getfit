json.extract! program,
              :id, :name, :preview, :description, :banner_url, :duration, :price, :workouts_count

json.trainer do
  json.partial! 'api/trainers/trainer', trainer: program.trainer
end
