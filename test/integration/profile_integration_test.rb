require 'test_helper'
class ProfileIntegrationTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers 
    def setup
        @user = users(:one)
        sign_in @user
        get edit_profile_path(@user)
    end

    test 'profile updated successfully' do
        new_name = 'new name'
        new_role = 1
        new_bio = 'new bio'
        new_overview = 'new about me '

        patch profile_path(id:@user.id), params: {
            user: {
                name: new_name,
                role:  new_role,
                bio: new_bio,
                overview: new_overview
            }
        }
        assert_redirected_to unauthenticated_root_path
        follow_redirect!

        assert_not flash.empty?

        @user.reload
        assert_equal  new_name, @user.name
        assert_equal new_bio, @user.bio
        assert_equal new_overview, @user.overview
    end

    test 'profile can also update partially ' do
        new_role = 1 
        patch profile_path(@user), params: {
           user: {
            role: new_role
           }
        }
        assert_redirected_to unauthenticated_root_path
        follow_redirect!
        assert_not flash.empty?
        @user.reload
        assert_equal new_role, @user.role
    end

    test 'should not update profile with invalid data' do
        invalid_name = ''
        patch profile_path(@user), params: {
            user: {
                name: invalid_name
            }
        }
        assert_redirected_to unauthenticated_root_path
        follow_redirect!
        assert_not flash.empty?
        @user.reload
        assert_not_equal invalid_name, @user.name
    end
end
