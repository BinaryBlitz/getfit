require 'test_helper'

class Admin::TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:ticket)
    @trainer = trainers(:trainer)
    sign_in_admin
  end

  test 'should get index' do
    get admin_trainer_tickets_url(@trainer)
    assert_response :success
  end

  test 'should create ticket' do
    assert_difference('Ticket.count') do
      post admin_trainer_tickets_url(@trainer), params: {
        ticket: {
          content: @ticket.content,
          image: @ticket.image
        }
      }
    end

    assert_redirected_to admin_trainer_tickets_url(@trainer)
  end
end
