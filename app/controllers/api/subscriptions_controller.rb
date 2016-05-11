class API::SubscriptionsController < API::APIController
  before_action :set_trainer, only: [:create]

  def create
    @subscription = current_user.subscriptions.build(trainer: @trainer)

    if @subscription.save
      render :show, status: :created
    else
      render json: @subscription.errors, status: 422
    end
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end
end
