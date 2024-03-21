class Booking < ApplicationRecord
  
  belongs_to :booking_type, optional: true
  belongs_to :mentor, class_name: 'User', foreign_key: 'mentor_id'
  belongs_to :mentee, class_name: 'User', foreign_key: 'mentee_id'
  has_one :booking_history, dependent: :destroy
  validates :introduction_text, presence: true, length: { in: 10..500 }
  validates :booking_datetime, presence: true
  validate :cannot_book_past
  validate :booking_time_available
  after_create :create_booked_time
  private 
  
  def cannot_book_past
    if booking_datetime.present? && booking_datetime < DateTime.current #datetime.current is utc zone and datetime.now is local time zone 
      errors.add(:booking_datetime, "can't be in the past")
    end
  end
  
  def create_booked_time
    BookedTime.create(start_time: self.booking_datetime, end_time: self.booking_datetime + self.booking_type.minutes * 60, mentor_id: self.mentor_id)
  end

    def booking_time_available
      mentor = User.find(self.mentor_id)
      conflicting_booked_times = mentor.booked_times.any? do |bt|
        self.booking_datetime >= bt.start_time && self.booking_datetime <= bt.end_time
      end
      # conflicting_booked_times = mentor.booked_times.where('(start_time <= ? AND end_time >= ?) OR (start_time >= ? AND end_time <= ?)', self.booking_datetime, self.booking_datetime, self.booking_datetime, self.booking_datetime + self.booking_type.minutes)
    
      if conflicting_booked_times
        errors.add(:booking_datetime, 'Mentor is not available at that time')
      end
    end
  

  # def create_booking_history
  #   self.build_booking_history(session_name: self.session_name, mentor_name: self.user.name, mentee_name: self.book_user_name, booking_date: self.booking_date, booking_time: self.booking_time)
  # end

 
  
end
