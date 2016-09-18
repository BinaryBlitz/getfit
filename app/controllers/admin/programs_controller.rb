class Admin::ProgramsController < Admin::AdminController
  before_action :set_program, only: [:show, :destroy, :approve, :reject]

  def index
    @programs = Program.unapproved.general
  end

  def show
  end

  def destroy
    @program.update_attribute(:deleted_at, Time.zone.now)
    redirect_to admin_programs_path, notice: 'Программа снята с продажи.'
  end

  def approve
    @program.approve
    redirect_to admin_program_path(@program), notice: 'Программа одобрена.'
  end

  def reject
    @program.reject
    redirect_to admin_program_path(@program), notice: 'Программа отклонена.'
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end
end
