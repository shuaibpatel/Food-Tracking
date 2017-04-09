require 'test_helper'

class Home1ControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contactUs" do
    get :contactUs
    assert_response :success
  end

  test "should get findUs" do
    get :findUs
    assert_response :success
  end

end
