json.extract! program, :name, :preview, :description, :banner_url, :duration, :price

json.trainer do
  json.partial! 'api/trainers/trainer', trainer: program.trainer
end
