class Trainer::ProgramsController < Trainer::TrainerController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = current_trainer.programs.general
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
      redirect_to [:trainer, @program], notice: 'Программа успешно создана'
    else
      render :new
    end
  end

  def update
    if @program.update(program_params)
      redirect_to [:trainer, @program], notice: 'Программа успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @program.destroy
    redirect_to trainer_programs_url, notice: 'Программа успешно удалена'
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(
      :name, :preview, :description, :banner, :price, :program_type_id
    )
  end
end
