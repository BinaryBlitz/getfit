# Phone number normalization and validation
module Phonable
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_phone_number
    validates :phone_number, phone: true, uniqueness: true, unless: :skip_phone_number_validation?
  end

  private

  def normalize_phone_number
    return unless phone_number
    self.phone_number = Phonelib.parse(phone_number).e164
  end

  def skip_phone_number_validation?
    return false unless is_a?(User)
    oauth?
  end
end
