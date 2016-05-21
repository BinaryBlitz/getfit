json.array! @programs do |program|
  json.partial! 'api/programs/program', program: program

  json.program_type do
    json.partial! 'api/program_types/program_type', program_type: program.program_type
  end

  json.trainer do
    json.partial! 'api/trainers/trainer', trainer: program.trainer
  end
end
