# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  phone_number :string
#  description  :text
#  avatar       :string
#  banner       :string
#  height       :integer
#  weight       :integer
#  birthdate    :date
#  gender       :string
#  api_token    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  vk_id        :integer
#  fb_id        :integer
#  device_token :string
#  platform     :string
#

class User < ApplicationRecord
  attr_accessor :verification_token

  has_many :comments, as: :author, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :personal_programs, through: :subscriptions, source: :program
  has_many :user_notifications, through: :subscriptions
  has_many :personal_trainers, through: :subscriptions, source: :trainer
  has_many :followings, dependent: :destroy
  has_many :following, through: :followings, source: :trainer
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :purchases, dependent: :destroy
  has_many :programs, through: :purchases
  has_many :workout_sessions, dependent: :destroy
  has_many :exercise_sessions, through: :workout_sessions

  validates :first_name, :last_name, presence: true
  validates :height, :weight, numericality: { greater_than: 0 }, allow_nil: true
  validates :gender, inclusion: { in: %w(male female) }, allow_nil: true
  validates :device_token, presence: true, if: 'platform.present?'
  validates :platform, inclusion: { in: %w(ios android) }, if: 'device_token.present?'
  validate :verified_phone_number, on: :create, unless: :oauth?

  include Authenticable
  include Phonable

  has_secure_token :api_token

  mount_base64_uploader :avatar, AvatarUploader
  mount_base64_uploader :banner, ImageUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def verified_phone_number
    return if VerificationToken.verified.find_by(phone_number: phone_number)
    errors.add(:phone_number, "isn't verified")
  end

  def oauth?
    vk_id.present? || fb_id.present?
  end
end
