require 'test_helper'

class Trainer::AdminMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:message)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test 'should get index' do
    get trainer_admin_messages_url
    assert_response :success
  end

  test 'should create message' do
    assert_difference('Message.count') do
      post trainer_admin_messages_url, params: {
        message: {
          content: @message.content,
          image: @message.image
        }
      }
    end

    assert_redirected_to trainer_admin_messages_url
  end
end
