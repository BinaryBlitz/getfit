require 'test_helper'

class Trainer::TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:ticket)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test 'should get index' do
    get trainer_tickets_url
    assert_response :success
  end

  test 'should create ticket' do
    assert_difference('Ticket.count') do
      post trainer_tickets_url, params: {
        ticket: {
          content: @ticket.content,
          image: @ticket.image
        }
      }
    end

    assert_redirected_to trainer_tickets_url
  end
end
