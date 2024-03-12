class BookingType < ApplicationRecord
    has_many  :bookings, optional: true
end
