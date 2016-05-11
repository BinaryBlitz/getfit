json.array! @workouts do |workout|
  json.partial! 'api/workouts/workout', workout: workout

  json.program do
    json.partial! 'api/programs/program_preview', program: workout.program
  end
end
