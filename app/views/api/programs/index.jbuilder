json.array! @programs do |program|
  json.partial! 'api/programs/program', program: program

  if current_user
    json.purchase_id current_user.purchases.find_by(program: program).try(:id)
    json.rating_id current_user.ratings.find_by(ratable: program).try(:id)
  end

  json.program_type do
    json.partial! 'api/program_types/program_type', program_type: program.program_type
  end

  json.trainer do
    json.partial! 'api/trainers/trainer', trainer: program.trainer
  end
end
