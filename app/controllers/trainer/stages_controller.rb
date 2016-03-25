class Trainer::StagesController < Trainer::TrainerController
  before_action :set_program, only: [:index, :new, :create]
  before_action :set_stage, only: [:show, :edit, :update, :destroy]

  def index
    @stages = @program.stages
  end

  def show
  end

  def new
    @stage = @program.stages.build
  end

  def edit
  end

  def create
    @stage = Stage.new(stage_params)

    if @stage.save
      redirect_to [:trainer, @stage], notice: 'Stage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @stage.update(stage_params)
      redirect_to [:trainer, @stage], notice: 'Stage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @stage.destroy
    redirect_to trainer_stages_url, notice: 'Stage was successfully destroyed.'
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_stage
    @stage = Stage.find(params[:id])
  end

  def stage_params
    params.fetch(:trainer_stage, {})
  end
end
