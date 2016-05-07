class Statistics
  def initialize(user)
    @user = user
  end

  def workouts_count
    @user.workout_sessions.completed.count
  end

  def total_duration
    @user.programs.sum(:duration) + @user.personal_programs.sum(:duration)
  end

  def total_distance
    @user.exercise_sessions.completed.sum(:distance)
  end
end
