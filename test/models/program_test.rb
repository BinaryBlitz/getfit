# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  preview         :string
#  description     :text
#  banner          :string
#  price           :integer          default(0)
#  trainer_id      :integer
#  program_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  approved        :boolean
#  subscription_id :integer
#  rating          :float            default(0.0)
#  workouts_count  :integer          default(0)
#  users_count     :integer          default(0)
#  deleted_at      :datetime
#

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  setup do
    @program = programs(:program)
  end

  test 'valid' do
    assert @program.valid?
  end

  test 'positive price' do
    @program.price = -1
    assert @program.invalid?

    @program.price = 0
    assert @program.valid?
  end

  test 'validations when subscription is present' do
    @program.subscription = subscriptions(:subscription)
    @program.price = nil

    assert @program.valid?
  end

  test 'counter cache' do
    Trainer.reset_counter_cache

    trainer = @program.trainer
    new_program = @program.dup

    assert_difference -> { trainer.reload.programs_count } do
      new_program.save
      new_program.approve
    end

    assert_difference -> { trainer.reload.programs_count }, -1 do
      new_program.destroy
    end
  end
end
