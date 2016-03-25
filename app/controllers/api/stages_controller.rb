class API::StagesController < ApplicationController
  before_action :set_stageable, only: [:index]
  before_action :set_stage, only: [:show]

  def index
    @stages = @stageable.stages
  end

  def show
  end

  private

  def set_stageable
    stageable = [Program, Subscription].detect { |s| params["#{s.name.underscore}_id"] }
    @stageable = stageable.find(params["#{stageable.name.underscore}_id"])
  end

  def set_stage
    @stage = Stage.find(params[:id])
  end
end
