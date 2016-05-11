json.partial! 'program', program: @program

json.workouts @program.workouts do |workout|
  json.partial! 'api/workouts/workout', workout: workout

  json.exercises workout.exercises, partial: 'api/exercises/exercise', as: :exercise
end
