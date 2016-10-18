json.partial! 'program', program: @program

if current_user
  json.purchase_id current_user.purchases.find_by(program: @program).try(:id)
end

json.program_type do
  json.partial! 'api/program_types/program_type', program_type: @program.program_type
end

json.trainer do
  json.partial! 'api/trainers/trainer', trainer: @program.trainer

  if current_user
    json.following_id current_user.followings.find_by(trainer: @program.trainer).try(:id)
  end
end

json.workouts @program.workouts do |workout|
  json.partial! 'api/workouts/workout', workout: workout

  json.exercises workout.exercises, partial: 'api/exercises/exercise', as: :exercise
end
