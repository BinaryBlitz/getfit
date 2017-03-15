class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_devise_locale, if: :devise_controller?

  layout :layout_by_resource

  protected

  def layout_by_resource
    return 'application' unless devise_controller?

    if resource_name == :trainer
      'trainer'
    elsif resource_name == :admin
      'admin'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    if resource_name == :trainer
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: [
          :first_name, :last_name, :phone_number, :description, :place_of_work,
          :specialization_id, :avatar, :banner, :avatar_cache, :banner_cache,
          :category, :experience
        ]
      )
    end
  end

  def set_devise_locale
    I18n.locale = :ru
  end
end
