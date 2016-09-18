class API::SubscriptionsController < API::APIController
  before_action :set_trainer, only: [:create]
  before_action :set_subscription, only: [:update]

  def index
    @subscriptions = current_user.subscriptions
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    @subscription.trainer = @trainer

    if @subscription.save!
      render :show, status: :created
    else
      render json: @subscription.errors, status: 422
    end
  end

  def update
    if @subscription.update(subscription_params)
      head :ok
    else
      render json: @subscription.errors, status: 422
    end
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params
      .require(:subscription)
      .permit(:condition, :weekly_load, :goal, :location, :home_equipment, :expires_on)
  end
end
