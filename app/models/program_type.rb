# == Schema Information
#
# Table name: program_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProgramType < ApplicationRecord
  validates :name, presence: true
end
