class Admin::ProgramsController < Admin::AdminController
  before_action :set_program, only: [:show, :approve]

  def index
    @programs = Program.unapproved.general
  end

  def show
  end

  def approve
    @program.approve
    redirect_to admin_programs_path
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end
end
