json.partial! 'api/ratings/rating', rating: @rating

json.ratable do
  case @rating.ratable_type
  when 'Program'
    json.partial! 'api/programs/program', program: @rating.ratable
  when 'Trainer'
    json.partial! 'api/trainers/trainer_preview', trainer: @rating.ratable
  end
end
