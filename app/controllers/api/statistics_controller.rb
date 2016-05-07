class API::StatisticsController < API::APIController
  before_action :set_user, only: [:index]

  def index
    @statistics = Statistics.new(current_user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
