class Trainer::ExercisesController < Trainer::TrainerController
  before_action :set_stage, only: [:index, :new, :create]
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = @stage.exercises.build(exercise_params)

    if @exercise.save
      redirect_to trainer_stage_exercises_url(@exercise.stage), notice: 'Exercise was successfully created.'
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to trainer_stage_exercises_url(@exercise.stage), notice: 'Exercise was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to trainer_stage_exercises_url(@exercise.stage), notice: 'Exercise was successfully destroyed.'
  end

  private

  def set_stage
    @stage = Stage.find(params[:stage_id])
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:exercise_type_id, :sets, :reps, :weight, :distance)
  end
end
