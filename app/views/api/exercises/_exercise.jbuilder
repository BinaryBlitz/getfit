json.extract! exercise, :sets, :reps, :weight, :distance, :duration

json.exercise_type do
  json.extract! exercise.exercise_type, :name, :video_url, :description
end
