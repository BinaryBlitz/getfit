class API::FollowingsController < API::APIController
  before_action :set_trainer, only: [:create]
  before_action :set_following, only: [:destroy]

  def create
    @following = @trainer.followings.build(user: current_user)

    if @following.save
      render :show, status: :created
    else
      render json: @following.errors, status: 422
    end
  end

  def destroy
    @following.destroy
    head :no_content
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end

  def set_following
    @following = current_user.followings.find(params[:id])
  end
end
