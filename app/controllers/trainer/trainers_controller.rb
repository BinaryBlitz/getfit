class Trainer::TrainersController < Trainer::TrainerController
  before_action :authenticate_trainer!
  before_action :set_trainer

  def show
  end

  def edit
  end

  def update
    if @trainer.update(trainer_params)
      redirect_to edit_trainer_trainer_path, notice: 'Профиль успешно обновлён'
    else
      render :edit
    end
  end

  private

  def set_trainer
    @trainer = current_trainer
  end

  def trainer_params
    params
      .require(:trainer)
      .permit(
        :first_name, :last_name, :phone_number, :description,
        :place_of_work, :specialization_id, :avatar, :banner,
        :avatar_cache, :banner_cache, :category, :experience
      )
  end
end
