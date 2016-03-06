class Trainer::ProgramsController < Trainer::TrainerController
  before_action :authenticate_trainer!
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.all
  end

  def show
  end

  def new
    @program = Program.new
  end

  def edit
  end

  def create
    @program = current_trainer.programs.build(program_params)

    if @program.save
      redirect_to [:trainer, @program], notice: 'Program was successfully created.'
    else
      render :new
    end
  end

  def update
    if @program.update(program_params)
      redirect_to [:trainer, @program], notice: 'Program was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @program.destroy
    redirect_to trainer_programs_url, notice: 'Program was successfully destroyed.'
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end


  def program_params
    params.require(:program).permit(
      :name, :preview, :description, :banner, :duration, :price, :program_type_id
    )
  end
end
