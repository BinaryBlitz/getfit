class API::TrainingsController < API::APIController
  before_action :set_training, only: [:show]

  def index
    @trainings = current_user.trainings
  end

  def show
  end

  def create
    @training = current_user.trainings.build(create_training_params)

    if @training.save
      render :show, status: :created, location: [:api, @training]
    else
      render json: @training.errors, status: 422
    end
  end

  def update
    if @training.update(training_params)
      head :ok
    else
      render json: @training.errors, status: 422
    end
  end

  def destroy
    @training.destroy
    head :no_content
  end

  private

  def set_training
    @training = Training.find(params[:id])
  end

  def create_training_params
    params.require(:training).permit(:stage_id, :scheduled_for)
  end

  def training_params
    params.require(:training).permit(:scheduled_for, :completed)
  end
end
