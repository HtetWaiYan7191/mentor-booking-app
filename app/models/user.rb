class User < ApplicationRecord

    enum role: {mentee: 0, mentor: 1}

    has_one :address
    has_many :social_links
    has_many :reviews, foreign_key: 'user_id', class_name: 'Review'
    has_many :given_reviews, foreign_key: 'reviewer_id', class_name: 'Review'
    has_many :bookings
    has_many :booking_histories, through: :bookings

    validates :name, presence: true, allow_blank: false
    validate :valid_role
    validates :overview, length: {in: 10..1000}, allow_blank: false
    validates :bio, length: {in: 6..500}, allow_nil: true
    validates :view_count, numericality: {only_integer: true}
    
    private
    
    def valid_role
        unless role.in?(User.roles.keys)
            errors.add(:role, 'must be either mentee or mentor')
        end
    end


end
