require 'test_helper'

class Admin::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:message)
    @trainer = trainers(:trainer)
    sign_in_admin
  end

  test 'should get index' do
    get admin_trainer_messages_url(@trainer)
    assert_response :success
  end

  test 'should create message' do
    assert_difference('Message.count') do
      post admin_trainer_messages_url(@trainer), params: {
        message: {
          content: @message.content,
          image: @message.image
        }
      }
    end

    assert_redirected_to admin_trainer_messages_url(@trainer)
  end
end
