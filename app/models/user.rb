class User < ApplicationRecord
    has_one :address
    has_many :social_links
    has_many :reviews, foreign_key: 'user_id', class_name: 'Review'
    has_many :given_reviews, foreign_key: 'reviewer_id', class_name: 'Review'
    has_many :bookings
    has_many :booking_histories, through: :bookings

end
