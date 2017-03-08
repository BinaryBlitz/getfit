json.array! @workouts do |workout|
  json.cache! [workout, workout.program] do
    json.partial! 'api/workouts/workout', workout: workout

    json.program do
      json.partial! 'api/programs/program_preview', program: workout.program
    end
  end
end
