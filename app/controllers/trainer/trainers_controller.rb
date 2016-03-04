class Trainer::TrainersController < Trainer::TrainerController
  before_action :authenticate_trainer!

  def show
  end
end
