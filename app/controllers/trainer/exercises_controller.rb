class Trainer::ExercisesController < Trainer::TrainerController
  before_action :set_program, only: [:index, :new, :create]
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
    @exercise = @program.exercises.build(exercise_params)

    if @exercise.save
      redirect_to trainer_program_exercises_url(@exercise.program), notice: 'Exercise was successfully created.'
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to trainer_program_exercises_url(@exercise.program), notice: 'Exercise was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to trainer_program_exercises_url(@exercise.program), notice: 'Exercise was successfully destroyed.'
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:exercise_type_id, :sets, :reps, :weight, :distance)
  end
end
