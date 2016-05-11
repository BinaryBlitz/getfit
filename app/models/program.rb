# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  preview         :string
#  description     :text
#  banner          :string
#  duration        :integer          default(0)
#  price           :integer          default(0)
#  trainer_id      :integer
#  program_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  approved        :boolean          default(FALSE)
#  subscription_id :integer
#  rating          :float
#  workouts_count  :integer          default(0)
#

class Program < ApplicationRecord
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :trainer
  belongs_to :program_type, optional: true
  belongs_to :subscription, optional: true

  has_many :posts, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :users, through: :purchases
  has_many :ratings, dependent: :destroy
  has_many :workouts, dependent: :destroy

  validates :name, presence: true
  validates :preview, :description, :banner, :program_type,
            presence: true, unless: 'subscription.present?'
  validates :duration, numericality: { greater_than: 0 }, unless: 'subscription.present?'
  validates :price, numericality: { greater_than_or_equal_to: 0 }, unless: 'subscription.present?'

  mount_uploader :banner, ImageUploader

  scope :approved, -> { where(approved: true) }
  scope :visible, -> { where(subscription: nil) }

  private

  def update_counter_cache
    trainer.update(programs_count: trainer.programs.visible.count)
  end
end
