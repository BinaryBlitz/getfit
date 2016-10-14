class Admin::TicketsController < Admin::AdminController
  before_action :set_conversation, only: [:index, :create]
  before_action :set_tickets, only: [:index, :create]

  def index
    @tickets = @conversation.tickets.order(created_at: :desc)
    @ticket = @conversation.tickets.build
  end

  def create
    @ticket = @conversation.tickets.build(ticket_params)
    @ticket.category = 'admin'

    if @ticket.save
      redirect_to admin_trainer_tickets_url
    else
      render :index
    end
  end

  private

  def set_conversation
    @conversation = Trainer.find(params[:trainer_id]).conversation
  end

  def set_tickets
    @tickets = @conversation.tickets
  end

  def ticket_params
    params.fetch(:ticket, {}).permit(:content, :image)
  end
end
