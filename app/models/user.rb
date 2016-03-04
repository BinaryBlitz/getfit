# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  phone_number :string           not null
#  description  :text
#  avatar       :string
#  banner       :string
#  height       :integer          not null
#  weight       :integer          not null
#  birthdate    :date             not null
#  gender       :string           not null
#  api_token    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  attr_accessor :verification_token
  
  has_many :comments, as: :author, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :personal_trainers, through: :subscriptions, source: :trainer
  has_many :followings, dependent: :destroy
  has_many :following, through: :followings, source: :trainer
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :purchases, dependent: :destroy
  has_many :programs, through: :purchases

  validates :name, :height, :weight, :birthdate, :gender, presence: true
  validates :height, :weight, numericality: { greater_than: 0 }
  validates :gender, inclusion: { in: %w(male female) }
  validates :phone_number, phone: true
  validate :verified_phone_number

  has_secure_token :api_token

  mount_base64_uploader :avatar, AvatarUploader

  private

  def verified_phone_number
    return if VerificationToken.verified.find_by(phone_number: phone_number)
    errors.add(:phone_number, "isn't verified")
  end
end
