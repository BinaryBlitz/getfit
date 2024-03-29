class Statistics
  def initialize(user)
    @user = user
  end

  def workouts_count
    @user.workout_sessions.completed.count
  end

  def total_duration
    @user.workouts.sum(:duration) + @user.personal_workouts.sum(:duration)
  end

  def total_distance
    @user.exercise_sessions.completed.sum(:distance)
  end

  def total_weight
    @user.exercise_sessions.completed.sum(:weight)
  end
end
