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
  has_many :comments, as: :author, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :personal_trainers, through: :subscriptions, source: :trainer
  has_many :followings, dependent: :destroy
  has_many :following, through: :followings, source: :trainer

  validates :name, :height, :weight, :birthdate, :gender, presence: true
  validates :height, :weight, numericality: { greater_than: 0 }
  validates :gender, inclusion: { in: %w(male female) }
  validates :phone_number, phone: true

  has_secure_token :api_token

  mount_base64_uploader :avatar, AvatarUploader
end
