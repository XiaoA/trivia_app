require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'test@example.com', password: 'a' * 128,
                     username: 'a' * 20)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'presence of email' do
    @user.email = ''
    refute @user.valid?
  end

  test 'presence of username' do
    @user.username = ''
    refute @user.valid?
  end

  test 'prsence of password' do
    @user.password = ''
    refute @user.valid?
  end

  test 'username > 21 characters' do
    @user.username = 'a' * 21
    refute @user.valid?
  end

  test 'username < 2 characters' do
    @user.username = 'a'
    refute @user.valid?
  end

  test 'password under 8 characters' do
    @user.password = 'a' * 7
    refute @user.valid?
  end

  test 'password > 128 characters' do
    @user.password = 'a' * 129
    refute @user.valid?
  end
end
