require 'test_helper'
class AddSocialLinkTest < ActionDispatch::IntegrationTest
    test " should create social link " do
        get '/profiles/1/edit'
        assert_difference 'SocialLink.count' do
            post profile_social_links_path(profile_id: User.first.id), params: {
                social_link: {
                    user_id: User.first.id,
                    icon: 'facebook',
                    link: 'https://example.com'
                }
            }
        end
        assert_redirected_to edit_profile_path(User.first.id)
        follow_redirect!
        assert_not flash.empty?
    end

    test " invalid social link information " do
        get '/profiles/1/edit'
        assert_no_difference 'SocialLink.count' do
            post profile_social_links_path(profile_id: User.first.id), params: {social_link: {
                user_id: User.first.id,
                icon: '1',
                link: '1'
            }}
        end
        assert_redirected_to edit_profile_path(User.first.id)
        follow_redirect!
        assert_not flash.empty?
    end
end