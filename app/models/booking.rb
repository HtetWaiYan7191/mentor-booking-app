class Booking < ApplicationRecord
  belongs_to :booking_type, optional: true
  belongs_to :user
  has_one :booking_history
end
