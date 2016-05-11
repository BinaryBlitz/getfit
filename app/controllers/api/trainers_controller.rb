class API::TrainersController < API::APIController
  skip_before_action :restrict_access

  def index
    @trainers = TrainerSearch.new(search_params).trainers
  end

  private

  def search_params
    params.permit(:category, :order)
  end
end
