require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'exampleName', overview: 'testOverview', bio: 'testBio', email: 'testemail@gmail.com',
                     password: 'password')
    @mentor = User.new(name: 'mentor', overview: 'I am metor', bio: 'Mentor, Teacher', role: 1,
                       email: 'mentor@gmail.com', password: 'password')
    @booking_type1 = BookingType.new(name: 'simple', minutes: 30, payment: 5)
    @booking_type2 = BookingType.new(name: 'pro', minutes: 60, payment: 10)
    @user.save
    @mentor.save
    @booking_type1.save
    @booking_type2.save
    @before_count = BookedTime.count
    @booking1 = Booking.new(booking_type_id: @booking_type1.id, mentor_id: @mentor.id,
                            introduction_text: 'this is introduction text from mentee', session_name: 'Software development', mentee_id: @user.id, booking_datetime: DateTime.new(2024, 3, 25, 5, 30, 0))
    @booking2 = Booking.new(booking_type_id: @booking_type2.id, mentor_id: @mentor.id,
                            introduction_text: 'this is introduction text from mentee', session_name: 'Web development', mentee_id: @user.id, booking_datetime: DateTime.new(2024, 3, 27, 8, 30, 0))
    @booking1.save
    @booking2.save
  end

  test 'should exist in the database ' do
    assert Booking.exists?(@booking1.id)
    assert Booking.exists?(@booking2.id)
  end

  test 'booking should belong to mentor and mentee ' do
    assert_equal @booking1.mentor, @mentor
    assert_equal @booking1.mentee, @user
  end

  test 'introduction text length should be between 10 and 500' do
    @booking1.introduction_text = 'a' * 9
    assert_not @booking1.valid?
    @booking1.introduction_text = 'a' * 501
    assert_not @booking1.valid?
  end

  test ' booking date should not be in the past ' do
    @booking1.booking_datetime = DateTime.now - 1.day
    assert_not @booking1.valid?
  end

  test ' if booking successfully created bookedtime also create successfully ' do
    assert_not_equal @before_count, BookedTime.count
  end

  test 'should return confilct error if new booking time is not available ' do
    booking3 = Booking.new(booking_type_id: @booking_type2.id, mentor_id: @mentor.id,
                           introduction_text: 'this is introduction text from mentee', session_name: 'Web development', mentee_id: @user.id, booking_datetime: DateTime.new(2024, 3, 27, 8, 30, 0))
    assert_not_equal @booking1.booking_datetime, booking3.booking_datetime
    assert_not booking3.valid?
  end
end
