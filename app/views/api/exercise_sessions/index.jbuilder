json.array! @exercise_sessions do |exercise_session|
  json.partial! 'api/exercise_sessions/exercise_session', exercise_session: exercise_session
end
