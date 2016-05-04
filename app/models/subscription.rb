# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trainer_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ApplicationRecord
  after_create :create_default_program

  belongs_to :user
  belongs_to :trainer

  has_one :program, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_notifications, dependent: :destroy

  private

  def create_default_program
    create_program(
      name: "Personal training: #{user.full_name}",
      trainer: trainer
    )
  end
end
