json.array! @workout_sessions do |workout_session|
  json.partial! 'api/workout_sessions/workout_session', workout_session: workout_session

  json.workout do
    json.partial! 'api/workouts/workout', workout: workout_session.workout
  end
end
