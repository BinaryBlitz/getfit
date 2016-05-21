json.partial! 'program', program: @program

json.program_type do
  json.partial! 'api/program_types/program_type', program_type: @program.program_type
end

json.workouts @program.workouts do |workout|
  json.partial! 'api/workouts/workout', workout: workout

  json.exercises workout.exercises, partial: 'api/exercises/exercise', as: :exercise
end
