require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com',
                     password: 'Foobar123', password_confirmation: 'Foobar123')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'user name must be present' do
    @user.name = '        '
    assert_not @user.valid?
  end

  test 'user email must be present' do
    @user.email = '       '
    assert_not @user.valid?
  end

  test 'user name should not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'user email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'email validation should reject invalid email addresses' do
    @user.email = 'user@example,com'
    assert_not @user.valid?
  end

  test 'email addresses should be unique' do
    user_new = @user.dup
    user_new.email = @user.email.upcase
    @user.save
    assert_not user_new.valid?
  end

  test 'email addresses should be saved as lowercase' do
    mixed_case_email = 'Foo@EXAmple.coM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.email
  end

  test 'user with a valid name and email is still is not valid overall' do
    @user = User.create(name: 'New User', email: 'new_user@example.com')
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = ' ' * 8
    assert_not @user.valid?
  end

  test 'password should have minimum length of 8' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'password should have atleast one uppercase alphabet and one number' do
    @user.password = @user.password_confirmation = 'Password'
    assert_not @user.valid?
  end
end
