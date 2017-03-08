json.array! @programs do |program|
  json.cache! [program, program.trainer, program.program_type, current_user] do
    json.partial! 'api/programs/program', program: program

    json.trainer do
      json.partial! 'api/trainers/trainer', trainer: program.trainer
    end

    if program.program_type
      json.program_type do
        json.partial! 'api/program_types/program_type', program_type: program.program_type
      end
    end

    if current_user
      json.purchase_id current_user.purchases.find_by(program: program)&.id
      json.rating_id current_user.ratings.find_by(ratable: program)&.id
    end
  end
end
