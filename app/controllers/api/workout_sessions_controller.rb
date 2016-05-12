class API::WorkoutSessionsController < API::APIController
  before_action :set_workout_session, only: [:show, :update, :destroy]

  def index
    @workout_sessions = current_user.workout_sessions
  end

  def show
  end

  def update
    if @workout_session.update(workout_session_params)
      head :ok
    else
      render json: @workout_session.errors, status: 422
    end
  end

  def destroy
    @workout_session.destroy
    head :no_content
  end

  private

  def set_workout_session
    @workout_session = WorkoutSession.find(params[:id])
  end

  def workout_session_params
    params.require(:workout_session).permit(:scheduled_for, :completed)
  end
end
