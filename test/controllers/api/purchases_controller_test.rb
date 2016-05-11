require 'test_helper'

class API::PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase = purchases(:purchase)
    @program = @purchase.program
  end

  test 'should create purchase' do
    @purchase.destroy

    assert_difference 'Purchase.count' do
      post api_program_purchase_url(@program), params: { api_token: api_token }
    end

    assert_response :created
  end
end
