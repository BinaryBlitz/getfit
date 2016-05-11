class API::WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show]

  def index
    @workouts = Workout.all
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
