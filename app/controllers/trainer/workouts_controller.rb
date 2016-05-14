class Trainer::WorkoutsController < Trainer::TrainerController
  before_action :set_program, only: [:index, :new, :create]
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = @program.workouts
  end

  def show
  end

  def new
    @workout = @program.workouts.build
  end

  def edit
  end

  def create
    @workout = @program.workouts.build(workout_params)

    if @workout.save
      redirect_to trainer_workout_exercises_url(@workout), notice: 'Workout was successfully created.'
    else
      render :new
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to trainer_workout_exercises_url(@workout), notice: 'Workout was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to trainer_program_workouts_url(@workout.program), notice: 'Workout was successfully destroyed.'
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:position, :duration)
  end
end
