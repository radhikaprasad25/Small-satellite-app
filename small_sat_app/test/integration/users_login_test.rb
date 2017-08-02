require 'test_helper'
# User model tests
class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:radhika)
  end

  test 'login with invalid information' do
    get small_sat_login_path
    assert_template 'sessions/new'
    post small_sat_login_path, params: { session: { email: ' ', password: '' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with a valid user information' do
    get small_sat_login_path
    post small_sat_login_path, params: { session: { email: @user.email,
                                                    password: 'password' } }
    assert logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'

    assert_select 'a[href=?]', small_sat_login_path, count: 0
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', user_path(@user)
    delete logout_path
    assert_not logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select 'a[href=?]', small_sat_login_path
    assert_select 'a[href=?]', logout_path,  count: 0
    assert_select 'a[href=?]', user_path(@user), count: 0
  end
end
