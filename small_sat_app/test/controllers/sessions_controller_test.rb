require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get small_sat_login_path
    assert_response :success
  end

end
