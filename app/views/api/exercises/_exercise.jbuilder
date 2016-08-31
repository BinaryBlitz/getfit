json.extract! exercise, :sets, :reps, :weight, :distance, :duration

json.exercise_type do
  json.partial! 'api/exercise_types/exercise_type', exercise_type: exercise.exercise_type
end
