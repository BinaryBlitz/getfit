class Admin::MessagesController < Admin::AdminController
  before_action :set_conversation, only: [:index, :create]
  before_action :set_messages, only: [:index, :create]

  def index
    @messages = @conversation.messages.order(created_at: :desc)
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    @message.category = 'admin'

    if @message.save
      redirect_to admin_trainer_messages_url
    else
      render :index
    end
  end

  private

  def set_conversation
    @conversation = Trainer.find(params[:trainer_id]).conversation
  end

  def set_messages
    @messages = @conversation.messages
  end

  def message_params
    params.fetch(:message, {}).permit(:content, :image)
  end
end
