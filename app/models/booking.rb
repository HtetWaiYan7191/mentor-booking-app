class Booking < ApplicationRecord
  
  belongs_to :booking_type, optional: true
  belongs_to :user
  has_one :booking_history

  validates :book_user_name, presence: true, length: { maximum: 50 }
  validates :introduction_text, presence: true, length: { in: 10..500 }
  validates :booking_date, presence: true
  validates :booking_time, presence: true
  validate :date_cannot_be_in_the_past
  validate :time_cannot_be_in_the_past
   
  private 
  
  def date_cannot_be_in_the_past
    if booking_date.present? && booking_date < Date.today
      errors.add(:booking_date, "can't be in the past")
    end
  end

  def time_cannot_be_in_the_past
    puts "current time #{Time.current}"
    puts "booking time #{booking_time}"
    errors.add(:booking_time, "time cannot be in the past") if booking_time.present? && booking_time.strftime("%H:%M:%S") < Time.current.strftime("%H:%M:%S")
  end
  
end
