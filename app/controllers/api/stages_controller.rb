class API::StagesController < ApplicationController
  before_action :set_program, only: [:index]
  before_action :set_stage, only: [:show]

  def index
    @stages = @program.stages
  end

  def show
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_stage
    @stage = Stage.find(params[:id])
  end
end
