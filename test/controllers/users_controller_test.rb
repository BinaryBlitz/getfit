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

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'show' do
  end

  test 'update' do
  end

  test 'delete' do
  end
end
