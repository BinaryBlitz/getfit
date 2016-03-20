class API::UsersController < API::APIController
  skip_before_action :restrict_access, only: [:create, :authenticate_vk, :authenticate_fb]
  before_action :set_user, only: [:update]

  def show
    @user = params[:id].present? ? User.find(params[:id]) : current_user
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: 422
    end
  end

  def update
    if @user.update(user_params)
      head :ok
    else
      render json: @user.errors, status: 422
    end
  end

  def authenticate_vk
    if params[:token].present?
      vk = VkontakteApi::Client.new(params[:token])
      @user = User.find_or_create_from_vk(vk)
      render :show
    else
      head 422
    end
  rescue VkontakteApi::Error
    head 422
  end

  def authenticate_fb
    if params[:token].present?
      fb = Koala::Facebook::API.new(params[:token])
      @user = User.find_or_create_from_fb(fb)
      render :show
    else
      head 422
    end
  rescue Koala::Facebook::AuthenticationError
    head 422
  end


  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :phone_number, :description,
      :avatar, :banner, :height, :weight, :birthdate, :gender
    )
  end
end
