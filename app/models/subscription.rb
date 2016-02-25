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
  belongs_to :user
  belongs_to :trainer
end
