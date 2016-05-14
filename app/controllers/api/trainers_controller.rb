class API::TrainersController < API::APIController
  skip_before_action :restrict_access!, only: [:index]
  before_action :restrict_access, only: [:index]

  def index
    @trainers = TrainerSearch.new(search_params).trainers.page(params[:page])
  end

  private

  def search_params
    params.permit(:category, :order)
  end
end
