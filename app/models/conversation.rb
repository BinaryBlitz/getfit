# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  trainer_id :integer
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ApplicationRecord
  belongs_to :trainer
  belongs_to :admin

  has_many :messages, as: :messageable, dependent: :destroy
end
