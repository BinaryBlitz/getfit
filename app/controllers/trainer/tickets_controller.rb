class Trainer::TicketsController < Trainer::TrainerController
  before_action :set_conversation, only: [:index, :create]
  before_action :set_tickets, only: [:index, :create]

  def index
    @tickets = @conversation.tickets.order(created_at: :desc)
    @ticket = @conversation.tickets.build
  end

  def create
    @ticket = @conversation.tickets.build(ticket_params)
    @ticket.category = 'trainer'

    if @ticket.save
      redirect_to trainer_tickets_url
    else
      render :index
    end
  end

  private

  def set_conversation
    @conversation = current_trainer.conversation
  end

  def set_tickets
    @tickets = @conversation.tickets
  end

  def ticket_params
    params.fetch(:ticket, {}).permit(:content, :image)
  end
end
