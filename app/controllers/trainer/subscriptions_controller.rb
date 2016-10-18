class Trainer::SubscriptionsController < Trainer::TrainerController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = Subscription.order(last_message_created_at: :desc)
  end

  def show
    @user = @subscription.user
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.fetch(:subscription, {})
  end
end
