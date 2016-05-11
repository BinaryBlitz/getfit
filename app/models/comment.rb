# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  content     :text
#  post_id     :integer
#  author_id   :integer
#  author_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :author, polymorphic: true

  validates :content, presence: true
end
