class API::ProgramsController < API::APIController
  skip_before_action :restrict_access, only: [:index, :show]
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
