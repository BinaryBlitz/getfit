class API::MessagesController < API::APIController
  before_action :set_subscription

  def index
    @messages = @subscription.messages.order(created_at: :desc)
  end

  private

  def set_subscription
    @subscription = current_user.subscriptions.find(params[:subscription_id])
  end
end
