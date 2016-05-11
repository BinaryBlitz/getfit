class API::ProgramsController < API::APIController
  skip_before_action :restrict_access, only: [:index, :show]
  before_action :set_program, only: [:show]

  def index
    @programs = ProgramSearch.new(search_params).programs
  end

  def show
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end

  def search_params
    params.permit(:order, :program_type_id, :min_price, :max_price)
  end
end
