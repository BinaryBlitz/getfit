# == Schema Information
#
# Table name: specializations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Specialization < ApplicationRecord
  has_many :trainers

  validates :name, presence: true
end
