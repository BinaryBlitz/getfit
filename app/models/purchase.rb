# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :program

  validates :program, uniqueness: { scope: :user }
end
