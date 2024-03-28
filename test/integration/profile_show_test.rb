require 'test_helper'
class ProfileShowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    sign_in @user
    get unauthenticated_root_path
  end

  test 'should redirect to the profile show page with specific html elements' do
    get profile_path(@user)
    assert_response :success
    assert_select "p", text: "show page #{@user.name}"
  end

end
