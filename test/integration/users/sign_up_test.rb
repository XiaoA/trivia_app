require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest

  test 'New User Form Fields' do
    get new_user_registration_path
    assert_response :success
    assert_select '#user_email'
    assert_select '#user_username'
    assert_select '#user_password'
    assert_select '#user_password_confirmation'
  end

  test 'New User Signup' do
    get new_user_registration_path
    assert_response :success
    assert_difference('User.count', 1) do
      post user_registration_path, params: { user: { email: 'signup@email.com',
                                       username: 'new_user', password: 'password',
                                       password_confirmation: 'password' } }
    end
  end

  test 'Invalid New User Signup' do
    get new_user_registration_path
    assert_response :success
    assert_difference('User.count', 0) do
      post user_registration_path, params: { user: { email: '', username: '',
                                   password: '', password_confirmation: '' } }
    end
    assert_equal true, @response.body.include?( '3 errors prohibited this user from being saved')
  end
end
