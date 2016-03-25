# == Schema Information
#
# Table name: stages
#
#  id             :integer          not null, primary key
#  stageable_type :string
#  stageable_id   :integer
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Stage < ApplicationRecord
  belongs_to :stageable, polymorphic: true

  has_many :exercises, dependent: :destroy
end
