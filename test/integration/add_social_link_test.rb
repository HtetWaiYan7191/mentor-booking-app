require 'test_helper'

class SocialLinksControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers # Include Devise test helpers

  def setup
    @user = users(:one) # Assuming you have fixtures or factories for users
    sign_in @user
  end

  test "should create social link" do
    assert_difference 'SocialLink.count', 1 do
      post profile_social_links_path(profile_id: @user.id), params: {
        social_link: {
          user_id: @user.id,
          icon: 'facebook',
          link: 'https://example.com'
        }
      }
    end
    assert_redirected_to edit_profile_path(@user.id)
    follow_redirect!
    assert_not flash.empty?
  end

  test "should not create social link with invalid data" do
    assert_no_difference 'SocialLink.count' do
      post profile_social_links_path(profile_id: @user.id), params: {
        social_link: {
          user_id: @user.id,
          icon: '1', # Invalid icon
          link: 'invalid-url' # Invalid link
        }
      }
    end
    assert_redirected_to edit_profile_path(@user.id)
    follow_redirect!
    assert_not flash.empty?
  end

    test 'should delete the social link ' do
        social_link = SocialLink.last
        assert_difference 'SocialLink.count', -1 do
            delete profile_social_link_path(profile_id: @user.id, id: social_link.id)
        end
        assert_redirected_to edit_profile_path(@user.id)
        follow_redirect!
        assert_not flash.empty?
    end
end
