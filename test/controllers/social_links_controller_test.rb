require 'test_helper'

class SocialLinksControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get social_links_new_url
    assert_response :success
  end

  test 'should get create' do
    get social_links_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get social_links_destroy_url
    assert_response :success
  end
end
