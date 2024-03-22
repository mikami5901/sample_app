require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end
  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not cookies[:remember_token].blank?
  end

  test "login without remembering" do
    # Cookieを保存してログイン
    log_in_as(@user, remember_me: '1')
    # Cookieが削除されていることを検証してからログイン
    log_in_as(@user, remember_me: '0')
    assert cookies[:remember_token].blank?
  end
end