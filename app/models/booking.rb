class Booking < ApplicationRecord
  
  belongs_to :booking_type, optional: true
  belongs_to :mentor, class_name: 'User', foreign_key: 'mentor_id'
  belongs_to :mentee, class_name: 'User', foreign_key: 'mentee_id'
  has_one :booking_history, dependent: :destroy
  validates :introduction_text, presence: true, length: { in: 10..500 }
  validates :booking_date, presence: true
  validates :booking_time, presence: true
  validate :date_cannot_be_in_the_past
  
  # after_create :create_booking_history
  private 
  
  def date_cannot_be_in_the_past
    puts Date.today
    puts booking_date
    if booking_date.present? && booking_date < Date.today
      errors.add(:booking_date, "can't be in the past")
    end
  end

  # def create_booking_history
  #   self.build_booking_history(session_name: self.session_name, mentor_name: self.user.name, mentee_name: self.book_user_name, booking_date: self.booking_date, booking_time: self.booking_time)
  # end

 
  
end
