class Booking < ApplicationRecord
  belongs_to :booking_type
  belongs_to :user
  has_one :booking_history
end
