class Trainer::ExercisesController < Trainer::TrainerController
  before_action :set_workout, only: [:index, :new, :create]
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = @workout.exercises
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = @workout.exercises.build(exercise_params)

    if @exercise.save
      redirect_to trainer_workout_exercises_url(@exercise.workout),
                  notice: 'Упражнение успешно создано'
    else
      render :new
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to trainer_workout_exercises_url(@exercise.workout),
                  notice: 'Упражнение успешно обновлено'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to trainer_workout_exercises_url(@exercise.workout),
                notice: 'Упражнение успешно удалено'
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:exercise_type_id, :sets, :reps, :weight, :distance, :duration)
  end
end
