# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  preview         :string           not null
#  description     :text             not null
#  banner          :string           not null
#  duration        :integer          not null
#  price           :integer          not null
#  trainer_id      :integer
#  program_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  approved        :boolean          default(FALSE)
#

class Program < ApplicationRecord
  belongs_to :trainer
  belongs_to :program_type

  has_many :posts, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :users, through: :purchases
  has_many :ratings, dependent: :destroy
  has_many :workouts, dependent: :destroy

  validates :name, :preview, :description, :banner, :duration, :price, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  mount_uploader :banner, ImageUploader

  scope :approved, -> { where(approved: true) }
end
