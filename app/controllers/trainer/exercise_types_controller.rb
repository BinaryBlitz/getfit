class Trainer::ExerciseTypesController < Trainer::TrainerController
  before_action :set_exercise_type, only: [:show, :edit, :update, :destroy]

  def index
    @exercise_types = current_trainer.exercise_types
  end

  def show
  end

  def new
    @exercise_type = ExerciseType.new
  end

  def edit
  end

  def create
    @exercise_type = current_trainer.exercise_types.build(exercise_type_params)

    if @exercise_type.save
      redirect_to trainer_exercise_types_url, notice: 'Тип упражнения успешно создан'
    else
      render :new
    end
  end

  def update
    if @exercise_type.update(exercise_type_params)
      redirect_to trainer_exercise_types_url, notice: 'Тип упражнения успешно обновлён'
    else
      render :edit
    end
  end

  def destroy
    @exercise_type.destroy
    redirect_to trainer_exercise_types_url, notice: 'Тип упражнения успешно удалён'
  end

  private

  def set_exercise_type
    @exercise_type = ExerciseType.find(params[:id])
  end

  def exercise_type_params
    params.require(:exercise_type).permit(:name, :video_url, :description, :tips)
  end
end
