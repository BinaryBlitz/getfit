class Trainer::AdminMessagesController < Trainer::TrainerController
  before_action :set_conversation, only: [:index, :create]
  before_action :set_messages, only: [:index, :create]

  def index
    @messages = @conversation.messages.order(created_at: :desc)
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    @message.category = 'trainer'

    if @message.save
      redirect_to trainer_admin_messages_url, notice: 'Message was successfully created.'
    else
      render :index
    end
  end

  private

  def set_conversation
    @conversation = current_trainer.conversation
  end

  def set_messages
    @messages = @conversation.messages
  end

  def message_params
    params.fetch(:message, {}).permit(:content, :image)
  end
end
