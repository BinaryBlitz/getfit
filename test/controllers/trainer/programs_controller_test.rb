require 'test_helper'

class Trainer::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test 'should get index' do
    get trainer_programs_url
    assert_response :success
  end

  test 'should get new' do
    get new_trainer_program_url
    assert_response :success
  end

  test 'should create program' do
    assert_difference('Program.count') do
      post trainer_programs_url, params: {
        program: {
          name: @program.name,
          preview: @program.preview,
          description: @program.description,
          banner: @program.banner,
          duration: @program.duration,
          price: @program.price,
          trainer_id: @program.trainer_id,
          program_type_id: @program.program_type_id,
          banner: fixture_file_upload('public/blank.jpg')
        }
      }
    end

    assert_redirected_to trainer_program_path(Program.last)
  end

  test 'should show program' do
    get trainer_program_url(@program)
    assert_response :success
  end

  test 'should get edit' do
    get edit_trainer_program_url(@program)
    assert_response :success
  end

  test 'should update program' do
    new_name = 'New name'
    patch trainer_program_url(@program), params: {
      program: {
        name: new_name,
        banner: fixture_file_upload('public/blank.jpg')
      }
    }
    assert_redirected_to trainer_program_path(@program)
    assert_equal new_name, @program.reload.name
  end

  test 'should destroy program' do
    assert_difference('Program.count', -1) do
      delete trainer_program_url(@program)
    end

    assert_redirected_to trainer_programs_path
  end
end
