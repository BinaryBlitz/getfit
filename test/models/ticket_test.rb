require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  setup do
    @ticket = tickets(:ticket)
  end

  test 'valid' do
    assert @ticket.valid?
  end

  test 'invalid without content' do
    @ticket.content = nil
    assert @ticket.invalid?

    @ticket.content = ''
    assert @ticket.invalid?
  end

  test 'category from list' do
    valid_categories = %w(trainer admin)
    valid_categories.each do |category|
      @ticket.category = category
      assert @ticket.valid?
    end

    @ticket.category = 'a'
    assert @ticket.invalid?
  end
end
