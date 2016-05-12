# == Schema Information
#
# Table name: trainers
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string           not null
#  last_name              :string           not null
#  phone_number           :string           not null
#  description            :text             not null
#  place_of_work          :string           not null
#  specialization_id      :integer
#  avatar                 :string           not null
#  banner                 :string           not null
#  category               :string           not null
#  experience             :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  programs_count         :integer          default(0)
#  followers_count        :integer          default(0)
#

require 'test_helper'

class TrainerTest < ActiveSupport::TestCase
  setup do
    @trainer = trainers(:trainer)
  end

  test 'valid' do
    assert @trainer.valid?
  end

  test 'positive experience' do
    @trainer.experience = -1
    assert @trainer.invalid?

    @trainer.experience = 0
    assert @trainer.invalid?

    @trainer.experience = 1
    assert @trainer.valid?
  end

  test 'category from list' do
    @trainer.category = ''
    assert @trainer.invalid?

    @trainer.category = 'test'
    assert @trainer.invalid?

    valid_categories = %w(trainer nutritionist physician)
    valid_categories.each do |category|
      @trainer.category = category
      assert @trainer.reload.valid?
    end
  end
end
