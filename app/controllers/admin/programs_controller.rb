class Admin::ProgramsController < Admin::AdminController
  before_action :set_program, only: [:show, :approve, :reject]

  def index
    @programs = Program.unapproved.general
  end

  def show
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
