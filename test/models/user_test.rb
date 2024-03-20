require "test_helper"
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 def setup 
    @user = User.new(name: 'exampleName', overview: 'testOverview', bio: 'testBio')
    @address = Address.new(country_name: 'example country', city_name: 'example city')
    @social_link1 = SocialLink.new(icon: 'icon1', link: 'https://link1')
    @social_link2 = SocialLink.new(icon: 'icon2', link: 'https://link2')
    @user.address = @address
    @user.social_links << @social_link1 << @social_link2
 end

  # ASSOCIATION TESTS
  test 'user address and address should be same' do
    assert_equal @address, @user.address
    assert_not_nil @user.address
  end

  test "user should have many social links " do 
    assert @user.save
    assert_equal 2, @user.social_links.count
    assert_includes @user.social_links, @social_link1
    assert_includes @user.social_links, @social_link2
  end

  # NAME TESTS
  test "should be valid" do
    assert @user.valid?
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
