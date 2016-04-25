# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Notification < ApplicationRecord
  validates :content, presence: true
end
