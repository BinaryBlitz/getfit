json.extract! exercise_session, :id, :sets, :reps, :weight, :distance, :duration, :completed

json.exercise do
  json.partial! 'api/exercises/exercise', exercise: exercise_session.exercise
end
