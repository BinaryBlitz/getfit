class Admin::WorkoutsController < Admin::AdminController
  before_action :set_program, only: [:index]

  def index
    @workouts = @program.workouts
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end
end
