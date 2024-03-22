require "test_helper"
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 def setup 
    @user = User.new(name: 'exampleName', overview: 'testOverview', bio: 'testBio', email: 'testemail@gmail.com', password: 'password')
    @mentor = User.new(name: 'mentor', overview: 'I am metor', bio: 'Mentor, Teacher', role: 1, email: 'mentor@email.com', password: 'password' )
    @address = Address.new(country_name: 'example country', city_name: 'example city')
    @social_link1 = SocialLink.new(icon: 'icon1', link: 'https://link1')
    @social_link2 = SocialLink.new(icon: 'icon2', link: 'https://link2')
    @booking_type1 = BookingType.new(name: 'simple', minutes: 30, payment: 5)
    @booking_type2 = BookingType.new(name: 'pro', minutes: 60, payment: 10)
    @user.save
    @mentor.save
    @address.save
    @social_link1.save
    @social_link2.save
    @booking_type1.save
    @booking_type2.save

   @booking1 = Booking.new(booking_type_id: @booking_type1.id, mentor_id: @mentor.id, introduction_text: 'this is introduction text from mentee', session_name: 'Software development', mentee_id: @user.id, booking_datetime: DateTime.new(2024, 3, 25, 5, 30, 0))
   @booking2 = Booking.new(booking_type_id: @booking_type2.id, mentor_id: @mentor.id, introduction_text: 'this is introduction text from mentee', session_name: 'Web development', mentee_id: @user.id, booking_datetime: DateTime.new(2024, 3, 27, 8, 30, 0))
   @before_count = @mentor.booked_times.count
    unless @booking1.save && @booking2.save 
      puts "Failed to create bookings:"
      puts @booking1.errors.full_messages
      puts @booking2.errors.full_messages
    end

    @review1 = Review.new(review_text: 'review1', rating: 4, user_id: @mentor.id, reviewer_id: @user.id)
    @review2 = Review.new(review_text: 'review2', rating: 5, user_id: @mentor.id, reviewer_id: @user.id)
    @review1.save
    @review2.save

    @user.address = @address  
    @user.social_links << @social_link1 << @social_link2
    @mentor.reviews << @review1 << @review2

 end

  # ASSOCIATION TESTS
  test "user address and address should be same" do
    assert_equal @address, @user.address
    assert_not_nil @user.address
  end

  test 'when create a new user default address should be created' do
    @user4 = User.new(name: 'exampleName', overview: 'testOverview', bio: 'testBio', email: 'user4@gmail.com', password: 'password')
    assert_difference 'Address.count' do
      @user4.save
    end
  end

  test "user's address should be deleted when user is deleted" do
    @user3 = User.create(name: 'exampleName', overview: 'testOverview', bio: 'testBio', email: 'user3@gmail.com', password: 'password')
    @before_count = Address.count
    @user3.destroy
    assert_not_equal @before_count, Address.count
    # assert_difference 'Address.count', -1 do
    #   user.destroy
    # end
  end

  test "user should have many social links " do 
    assert_equal 2, @user.social_links.count
    assert_includes @user.social_links, @social_link1
    assert_includes @user.social_links, @social_link2
    assert_not_nil @user.social_links
  end

  test "review cannot be created without reviewer" do 
    @review1.reviewer_id = nil
    assert_not @review1.valid?
  end

  test "mentor should have many received reviews " do 
    assert_equal 2, @mentor.reviews.count
    assert_includes @mentor.reviews, @review1
    assert_includes @mentor.reviews, @review2
    assert_not_empty @mentor.reviews
  end

  test 'user should have many given reviews ' do 
    assert_equal 2 , @user.given_reviews.count
    assert_includes @user.given_reviews, @review1
    assert_includes @user.given_reviews, @review2
    assert_not_empty @user.given_reviews
  end
  # ASSOCIATION TESTS FOR MENTORS 
  test "mentor should valid" do 
    assert @mentor.valid?
    puts @mentor.errors.full_messages
  end

  test "mentor should have bookings " do
    assert_equal 2, @mentor.mentor_bookings.count
    assert_includes @mentor.mentor_bookings, @booking1
    assert_includes @mentor.mentor_bookings, @booking2
    assert_not_empty @mentor.mentor_bookings
  end

  test "user role should be mentor" do
    assert_equal 1, @mentor.role
  end

  # BOOKING TYPE TESTS  
  test "booking type  should be valid" do
    assert @booking_type1.valid?, @booking_type1.errors.full_messages.inspect
    assert @booking_type2.valid?, @booking_type2.errors.full_messages.inspect
  end

  # BOOKING TESTS 

  test "after booking create booked_time should be created" do
    assert_not_equal BookedTime.count, @before_count
  end


  test "booking should be exist in the database " do
    assert Booking.exists?(@booking1.id)
    assert Booking.exists?(@booking2.id)
  end


  # NAME TESTS
  test "should be valid" do
    assert @user.valid?, @user.errors.full_messages.inspect
  end

  test "name should not be blank" do
    @user.name = " "
    assert_not @user.valid?
  end

  test 'name should be downcase after save' do
    mix_case_name = 'HtetWaIYan'
    @user.name = mix_case_name
    @user.save 
    assert_equal @user.name, mix_case_name.downcase, @user.reload.name
  end

  test "name should be present " do 
    @user.name = nil 
    assert_not @user.valid?
  end

  test "name should not be more than 30 length" do
    @user.name = 'a' * 31
    assert_not @user.valid?
  end

  # OVERVIEW TESTS
  test "overview can be nil" do
    @user.overview = nil 
    assert @user.valid?
  end

  test "overview length should be between 10 and 1000" do
    @user.overview =  'a' * 9
    assert_not @user.valid?
    @user.overview = 'a' *  1001
    assert_not @user.valid?
  end

  test "overview should not be blank" do  
    @user.overview = ""
    assert_not @user.valid?
  end

  #BIO TESTS
  test "bio length should be between 6 and 500"do
    @user.bio = 'a' * 5
    assert_not @user.valid?
    @user.bio = 'a' * 501
    assert_not @user.valid?
  end

  test 'bio can be nil' do 
    @user.bio = nil
    assert @user.valid?
  end

  test 'bio can be blank' do 
    @user.bio = ''
    assert_not @user.valid?
  end


end
