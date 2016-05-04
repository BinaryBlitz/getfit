# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  preview         :string
#  description     :text
#  banner          :string
#  duration        :string
#  price           :string
#  trainer_id      :integer
#  program_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  approved        :boolean          default(FALSE)
#  subscription_id :integer
#

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  setup do
    @program = programs(:program)
  end

  test 'valid' do
    assert @program.valid?
  end

  test 'positive duration and price' do
    @program.duration = 0
    assert @program.invalid?

    @program.duration = 1
    assert @program.valid?

    @program.price = -1
    assert @program.invalid?

    @program.price = 0
    assert @program.valid?

    @program.price = 1
    assert @program.valid?
  end

  test 'validations when subscription is present' do
    @program.subscription = subscriptions(:subscription)
    @program.duration = nil
    @program.price = nil

    assert @program.valid?
  end

  test 'counter cache' do
    Trainer.reset_counter_cache

    trainer = @program.trainer
    new_program = @program.dup

    assert_difference -> { trainer.reload.visible_programs_count } do
      new_program.save
    end

    assert_difference -> { trainer.reload.visible_programs_count }, -1 do
      new_program.destroy
    end
  end
end
