json.cache! workout_session do
  json.extract! workout_session,
                :id, :workout_id, :scheduled_for, :completed, :created_at, :updated_at
end
