class API::WorkoutsController < API::APIController
  before_action :set_workout, only: [:show]

  def index
    @workouts = current_user.workouts
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
