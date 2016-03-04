# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  phone_number :string           not null
#  description  :text
#  avatar       :string
#  banner       :string
#  height       :integer          not null
#  weight       :integer          not null
#  birthdate    :date             not null
#  gender       :string           not null
#  api_token    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def update
    if @user.update(user_params)
      head :ok
    else
      render json: @user.errors, status: 422
    end
  end

  private

  def set_user
    @user = current_user
  end
end
