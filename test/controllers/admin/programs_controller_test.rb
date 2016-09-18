require 'test_helper'

class Admin::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
    sign_in_admin
  end

  test 'should get index' do
    get admin_programs_url
    assert_response :success
  end

  test 'should show program' do
    get admin_program_path(@program)
    assert_response :success
  end

  test 'should approve program' do
    patch approve_admin_program_path(@program)
    assert_redirected_to admin_program_path(@program)
    assert @program.reload.approved?
  end

  test 'should reject program' do
    patch reject_admin_program_path(@program)
    assert_redirected_to admin_program_path(@program)
    refute @program.reload.approved?
  end
end
