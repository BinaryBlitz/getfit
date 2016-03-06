class Trainer::TrainerController < ApplicationController
  before_action :authenticate_trainer!

  layout 'trainer'
end
