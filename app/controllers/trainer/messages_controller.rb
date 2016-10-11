class Trainer::MessagesController < Trainer::TrainerController
  before_action :set_subscription, only: [:index, :create]
  before_action :set_messages, only: [:index, :create]

  def index
    @subscription.touch(:viewed_by_trainer_at)
    @messages = @subscription.messages.order(created_at: :desc)
    @message = @subscription.messages.build
  end

  def create
    @message = @messages.build(message_params)
    @message.category = 'trainer'

    if @message.save
      redirect_to trainer_subscription_messages_url(@subscription),
                  notice: 'Message was successfully created.'
    else
      render :index
    end
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:subscription_id])
  end

  def set_messages
    @messages = @subscription.messages
  end

  def message_params
    params.fetch(:message, {}).permit(:content, :subscription_id, :image)
  end
end
