json.partial! 'program', program: @program

if current_user
  json.purchase_id current_user.purchases.find_by(program: @program).try(:id)
end

json.program_type do
  json.partial! 'api/program_types/program_type', program_type: @program.program_type
end

json.trainer do
  json.partial! 'api/trainers/trainer', trainer: @program.trainer
end

json.workouts @program.workouts do |workout|
  json.partial! 'api/workouts/workout', workout: workout

  json.exercises workout.exercises do |exercise|
    json.partial! 'api/exercises/exercise', exercise: exercise

    json.exercise_type do
      json.partial! 'api/exercise_types/exercise_type', exercise_type: exercise.exercise_type
    end
  end
end
