require "test_helper"

class SocialLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'exampleName', overview: 'testOverview', bio: 'testBio', email: 'testemail@gmail.com', password: 'password')
    @user.save
    @social_link1 = SocialLink.new(icon: 'icon1', link: 'https://link1', user_id: @user.id)
    @social_link1.save
  end
  
  test "social link cannot be duplicated in the same user" do
    duplicate_link = SocialLink.new(icon: 'icon1', link: 'https://link1', user_id: @user.id)
    assert_not duplicate_link.save , duplicate_link.errors.full_messages
  end

  test 'link invalid ' do
    @social_link1.link = 'testing'
    assert_not @social_link1.valid?
  end
  
  test 'icon and link must be presence' do
    @social_link1.icon = nil
    assert_not @social_link1.valid?
    @social_link1.link = nil
    assert_not @social_link1.valid?
  end


end
