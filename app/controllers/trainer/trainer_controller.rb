class Trainer::TrainerController < ApplicationController
  before_action :authenticate_trainer!
  before_action :set_locale

  layout 'trainer'

  private

  def set_locale
    I18n.locale = :ru
  end
end
