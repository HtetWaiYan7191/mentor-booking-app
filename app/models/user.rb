class User < ApplicationRecord
    has_one :address
    has_many :social_links
    has_many :reviews
    has_many :bookings
    has_many :booking_histories, through: :bookings

end
