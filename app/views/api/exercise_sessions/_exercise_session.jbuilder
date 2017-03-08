json.cache! [exercise_session, exercise_session.exercise] do
  json.extract! exercise_session, :id, :sets, :reps, :weight, :distance, :duration, :completed

  json.exercise do
    json.partial! 'api/exercises/exercise', exercise: exercise_session.exercise
  end
end
