class API::ProgramsController < API::APIController
  before_action :set_program, only: [:show]

  def index
    @programs = Program.approved
  end

  def show
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end
end
