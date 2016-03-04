class API::UsersController < API::APIController
  before_action :set_user, only: [:update]

  def show
    @user = params[:id].present? ? User.find(params[:id]) : current_user
  end

  def update
    if @user.update(user_params)
      head :ok
    else
      render json: @user.errors, status: 422
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :name, :phone_number, :description, :avatar, :banner,
      :height, :weight, :birthdate, :gender
    )
  end
end
