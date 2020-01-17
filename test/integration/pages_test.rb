require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest


  test "should get root" do
    sign_in users(:user1)
    get root_url
    assert_response :success
  end
end
