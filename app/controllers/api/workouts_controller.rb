class API::WorkoutsController < ApplicationController
  before_action :set_program, only: [:index]
  before_action :set_workout, only: [:show]

  def index
    @workouts = @program.workouts
  end

  def show
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
