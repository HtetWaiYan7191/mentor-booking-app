class BookingType < ApplicationRecord
    has_many  :bookings
    
    validates :name, presence: true
    validates :minutes, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1440 }
    validates :payment, numericality: {only_integer: true}

end
