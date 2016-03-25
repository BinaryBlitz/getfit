# == Schema Information
#
# Table name: stages
#
#  id         :integer          not null, primary key
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :integer
#

class Stage < ApplicationRecord
  belongs_to :program, optional: true

  has_many :exercises, dependent: :destroy
end
