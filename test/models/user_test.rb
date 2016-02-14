require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
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
end
