class Admin::TrainersController < Admin::AdminController
  before_action :set_trainer, only: [:show, :approve, :reject]

  def index
    @trainers = Trainer.all
  end

  def show
  end

  def approve
    @trainer.approve!
    redirect_to [:admin, @trainer], notice: 'Заявка одобрена.'
  end

  def reject
    @trainer.reject!
    redirect_to [:admin, @trainer], notice: 'Заявка отклонена.'
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end
end
