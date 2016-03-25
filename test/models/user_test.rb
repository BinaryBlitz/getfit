# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  phone_number :string
#  description  :text
#  avatar       :string
#  banner       :string
#  height       :integer
#  weight       :integer
#  birthdate    :date
#  gender       :string
#  api_token    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  vk_id        :integer
#  fb_id        :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'valid' do
    assert @user.valid?
  end

  test 'positive height and weight' do
    @user.height = -1
    assert @user.invalid?

    @user.height = 0
    assert @user.invalid?

    @user.height = 1
    assert @user.valid?
  end

  test 'gender' do
    @user.gender = ''
    assert @user.invalid?

    @user.gender = 'test'
    assert @user.invalid?

    @user.gender = 'male'
    assert @user.valid?

    @user.gender = 'female'
    assert @user.valid?
  end

  test 'phone number format' do
    @user.phone_number = '1'
    assert @user.invalid?

    @user.phone_number = '+79998887766'
    assert @user.valid?
  end

  test 'phone number is normalized' do
    phone_number = '79998887766'
    @user.phone_number = phone_number

    assert @user.valid?
    assert_equal Phonelib.parse(phone_number).e164, @user.phone_number
  end

  test 'phone number uniqueness' do
    user = users(:baz)
    user.phone_number = @user.phone_number

    assert user.invalid?
  end

  test 'phone number validation skipped on oauth' do
    @user.vk_id = 1
    @user.phone_number = nil

    assert @user.valid?
  end
end
