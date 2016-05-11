json.extract! program,
              :id, :name, :preview, :description, :banner_url,
              :rating, :duration, :price, :workouts_count, :users_count

json.program_type do
  json.partial! 'api/program_types/program_type', program_type: program.program_type
end

json.trainer do
  json.partial! 'api/trainers/trainer', trainer: program.trainer
end
