# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# naruto = User.create(name: 'naruto', overview: 'naruto overview', bio: " seven hokage")
# kakashi = User.create(name: 'kakashi', overview: 'kakashi overview', bio: "naruto's teacher")
# naruto_address = Address.create(user_id: naruto.id, country_name: 'Japan', city_name: 'konoha')
# naruto_link_1 = SocialLink.create(user_id: naruto.id, link: 'link1', icon: 'icon1')
# naruto_link_2 = SocialLink.create(user_id: naruto.id, link: 'link2', icon: 'icon2')
# review_1 = Review.create(user_id: kakashi.id, review_text: 'review 1 ', rating: 5, reviewer_id: naruto.id)
# review_2 = Review.create(user_id: kakashi.id, review_text: 'review 2 ', rating: 4, reviewer_id: naruto.id)
# review_3 = Review.create(user_id: kakashi.id, review_text: 'review 3 ', rating: 3, reviewer_id: naruto.id)

# firstBookingType = BookingType.create(name: 'basic', minutes: 30, payment: 0)
# secondBookingType = BookingType.create(name: 'intermediate', minutes: 60, payment: 15)
# thirdBookingType = BookingType.create(name: 'pro', minutes: 120, payment: 30)

booking1 = Booking.create(mentor_id: kakashi.id, booking_type_id: firstBookingType.id, mentee_id:naruto.id, introduction_text: ' hello kakashi, I am naruto ', booking_status: 0, booking_date: Date.new(2024,3,15) , session_name: 'software engineering', booking_time: Time.new(2024, 3, 15, 10, 30, 0) )
booking2 = Booking.create(mentor_id: kakashi.id, booking_type_id: firstBookingType.id, mentee_id:naruto.id, introduction_text: ' hello kakashi, I am naruto this is our session 2  ', booking_status: 0, booking_date: Date.new(2024,3,15) , session_name: ' web development ', booking_time: Time.new(2024, 4, 20, 10, 30, 0) )
booking3 = Booking.create(mentor_id: kakashi.id, booking_type_id: firstBookingType.id, mentee_id:naruto.id, introduction_text: ' This is our session three sensei kakashi  ', booking_status: 0, booking_date: Date.new(2024,3,15) , session_name: '  ninjutsu ', booking_time: Time.new(2024, 4, 25, 10, 30, 0) )

BookingHistory.create(booking_id: book1.id, session_name: book1.session_name, mentor_name: book1.user.name, mentee_name: book1.book_user_name, booking_date: book1.booking_date, booking_time: book1.booking_time)

booking5 = Booking.create(mentor_id: 2, booking_type_id: 1, mentee_id:1, introduction_text: ' This is our session three sensei kakashi  ', booking_status: 0, booking_date: Date.new(2023,3,15) , session_name: '  ninjutsu ', booking_time: Time.new(2024, 4, 25, 10, 30, 0)).valid?
booking6  = Booking.new(mentor_id: 2, booking_type_id: 1, mentee_id:1, introduction_text: ' This is our session three sensei kakashi  ', booking_status: 0, booking_date: Date.new(2024,3,15) , session_name: '  ninjutsu ', booking_time: new_booking_time)
