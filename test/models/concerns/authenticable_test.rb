require 'test_helper'

class AuthenticableTest < ActiveSupport::TestCase
  setup do
    @vk = vk_client
    @fb = fb_client
  end

  test 'create or find user from fb token' do
    assert_difference('User.count') do
      User.find_or_create_from_fb(@fb)
    end

    assert_no_difference 'User.count' do
      user = User.last
      old_fb_user = User.find_or_create_from_fb(@fb)
      assert_equal user, old_fb_user
    end
  end

  test 'create or find from vk token' do
    assert_difference 'User.count' do
      User.find_or_create_from_vk(@vk)
    end

    user = User.last
    assert_equal vk_user.uid, user.vk_id

    assert_no_difference 'User.count' do
      old_vk_user = User.find_or_create_from_vk(@vk)
      assert_equal user, old_vk_user
    end
  end

  private

  def fb_client
    object_data = {
      'id' => 12, 'first_name' => 'Face', 'last_name' => 'Book', 'name' => 'Name',
      'picture' => { 'data' => { 'url' => nil} }
    }
    stub(get_object: object_data)
  end

  def vk_client
    users = stub(get: [vk_user])
    friends = stub(get: [])
    stub(users: users, token: 'token', friends: friends)
  end

  def vk_user
    stub(
      first_name: 'Foo', last_name: 'Bar', screen_name: 'FooBar', uid: 2,
      photo_max_orig: nil, bdate: '01.02.1990', email: 'test@vk.com'
    )
  end
end
