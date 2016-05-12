# == Schema Information
#
# Table name: ratings
#
#  id           :integer          not null, primary key
#  value        :integer          not null
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content      :text
#  ratable_type :string
#  ratable_id   :integer
#

class Rating < ApplicationRecord
  after_commit :update_rating_cache

  belongs_to :ratable, polymorphic: true
  belongs_to :user

  validates :value, inclusion: { in: 1..5 }
  validates :content, length: { minimum: 1 }, allow_nil: true

  private

  def update_rating_cache
    ratable.update(rating: ratable.ratings.average(:value) || 0)
  end
end
