class API::APIController < ApplicationController
  protected

  attr_reader :current_user

  def restrict_access
    unless restrict_access_by_params
      render json: { message: 'Invalid API Token' }, status: 401
      return
    end
  end

  def restrict_access_by_params
    return true if @current_user

    @current_user = User.find_by_api_token(params[:api_token])
  end
end
