class API::MessagesController < API::APIController
  before_action :set_subscription

  def index
    @messages = @subscription.messages.order(created_at: :desc).page(params[:page])
  end

  def create
    @message = @subscription.messages.build(message_params.merge(category: 'user'))

    if @message.save
      render :show, status: :created
    else
      render json: @message.errors, status: 422
    end
  end

  private

  def set_subscription
    @subscription = current_user.subscriptions.find(params[:subscription_id])
  end

  def message_params
    params.require(:message).permit(:content, :image)
  end
end
