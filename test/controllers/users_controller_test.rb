require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get create_login_session" do
    get :create_login_session
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
