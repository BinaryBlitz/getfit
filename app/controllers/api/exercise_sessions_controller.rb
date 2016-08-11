class API::ExerciseSessionsController < API::APIController
  before_action :set_workout_session, only: [:index]
  before_action :set_exercise_session, only: [:update]

  def index
    @exercise_sessions = @workout_session.exercise_sessions.includes(:exercise)
  end

  def update
    if @exercise_session.update(exercise_session_params)
      head :ok
    else
      render json: @exercise_session.errors, status: 422
    end
  end

  private

  def set_workout_session
    @workout_session = current_user.workout_sessions.find(params[:workout_session_id])
  end

  def set_exercise_session
    @exercise_session = ExerciseSession.find(params[:id])
  end

  def exercise_session_params
    params
      .require(:exercise_session)
      .permit(:sets, :reps, :weight, :distance, :duration, :completed)
  end
end
