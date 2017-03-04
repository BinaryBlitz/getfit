json.array! @programs do |program|
  json.partial! 'api/programs/program', program: program

  if current_user
    json.purchase_id current_user.purchases.find_by(program: program)&.id
    json.rating_id current_user.ratings.find_by(ratable: program)&.id
  end

  if program.program_type
    json.program_type do
      json.partial! 'api/program_types/program_type', program_type: program.program_type
    end
  end

  json.trainer do
    json.partial! 'api/trainers/trainer', trainer: program.trainer

    if current_user
      json.following_id current_user.followings.find_by(trainer: program.trainer).try(:id)
    end
  end
end
