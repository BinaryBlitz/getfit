# == Schema Information
#
# Table name: subscriptions
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  trainer_id              :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  condition               :string
#  weekly_load             :integer
#  goal                    :string
#  location                :string
#  home_equipment          :string
#  expires_on              :date             not null
#  last_message_created_at :datetime
#  viewed_by_trainer_at    :datetime
#

class Subscription < ApplicationRecord
  GOALS = %w(weight_loss weight_gain drying stretching stamina strength comprehensive other)

  after_create :create_default_program

  belongs_to :user
  belongs_to :trainer

  has_one :program, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_notifications, dependent: :destroy

  validates :expires_on, presence: true
  validates :weekly_load, inclusion: { in: 1..7 }, allow_nil: true
  validates :condition, inclusion: { in: %w(beginner intermediate athlete) }, allow_nil: true
  validates :location, inclusion: { in: %w(gym street home) }, allow_nil: true
  validates :goal, inclusion: { in: GOALS }, allow_nil: true

  def viewed_by_trainer?
    return true unless last_message_created_at.present?
    return false unless viewed_by_trainer_at.present?

    viewed_by_trainer_at > last_message_created_at
  end

  private

  def create_default_program
    create_program(
      name: "Personal training: #{user.full_name}",
      trainer: trainer
    )
  end
end
