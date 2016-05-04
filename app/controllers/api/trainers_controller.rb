class API::TrainersController < API::APIController
  skip_before_action :restrict_access

  def index
    @trainers = Trainer.all
  end
end
