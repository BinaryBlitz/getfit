class API::TrainerProgramsController < API::APIController
  before_action :set_trainer, only: [:index]

  def index
    @programs = @trainer.programs
    render 'api/programs/index'
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end
end
