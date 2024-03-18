class User < ApplicationRecord

    # enum role: {mentor: 0, mentee: 1}

    has_one :address, dependent: :destroy
    accepts_nested_attributes_for :address
    has_many :social_links, dependent: :destroy
    accepts_nested_attributes_for :social_links
    has_many :reviews, foreign_key: 'user_id', class_name: 'Review'
    has_many :given_reviews, foreign_key: 'reviewer_id', class_name: 'Review'
    has_many :mentor_bookings, foreign_key: 'mentor_id', class_name: 'Booking'
    has_many :mentee_bookings, foreign_key: 'mentee_id', class_name: 'Booking'
    has_many :booking_histories, through: :bookings
    has_many :booked_times, foreign_key: 'mentor_id', class_name: 'BookedTime'

    validates :name, presence: true, allow_blank: false
    validates :overview, length: {in: 10..1000}, allow_blank: false
    validates :bio, length: {in: 6..500}, allow_nil: true
    validates :view_count, numericality: {only_integer: true}
    
    after_create :add_default_address
    private
    
    # def valid_role
    #     unless role.in?(User.roles.keys)
    #         errors.add(:role, 'must be either mentee or mentor')
    #     end
    # end

    # def add_default_social_links
    #     default_social_links = [
    #       { icon: 'facebook', link: 'https://www.facebook.com/yourpage' },
    #       { icon: 'github', link: 'https://www.github.com/yourpage' },
    #       { icon: 'linkedin', link: 'https://www.linkedin.com/yourpage' },
    #       { icon: 'instagram', link: 'https://www.instagram.com/yourpage' },
    #       { icon: 'medium', link: 'https://www.medium.com/yourpage' }
    #     ]
    #         default_social_links.each do |link_data|
    #             self.social_links.create(icon: link_data[:icon], link: link_data[:link])
    #         end
    # end

    def add_default_address
        # Check if the associated address exists
        unless address
          # Create a new address for the user
          build_address(country_name: nil, city_name: nil)
          save
        end
    end
end
