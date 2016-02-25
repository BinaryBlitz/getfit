# == Schema Information
#
# Table name: trainers
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string           not null
#  last_name              :string           not null
#  phone_number           :string           not null
#  description            :text             not null
#  place_of_work          :string           not null
#  specialization_id      :integer
#  avatar                 :string           not null
#  banner                 :string           not null
#  category               :string           not null
#  experience             :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Trainer < ApplicationRecord
  belongs_to :specialization

  has_many :photos, dependent: :destroy
  has_many :programs, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, as: :author, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  validates :first_name, :last_name, :phone_number, :description,
            :place_of_work, :category, :experience, presence: true
  validates :experience, numericality: { greater_than: 0 }
  validates :phone_number, phone: true

  extend Enumerize
  enumerize :category, in: [:trainer, :nutritionist, :physician]

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  mount_base64_uploader :avatar, AvatarUploader
end
