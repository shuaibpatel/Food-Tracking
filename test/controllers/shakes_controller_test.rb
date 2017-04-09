require 'test_helper'

class ShakesControllerTest < ActionController::TestCase
  setup do
    @shake = shakes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shake" do
    assert_difference('Shake.count') do
      post :create, shake: { Calories: @shake.Calories, Cost: @shake.Cost, Description: @shake.Description, Name: @shake.Name }
    end

    assert_redirected_to shake_path(assigns(:shake))
  end

  test "should show shake" do
    get :show, id: @shake
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shake
    assert_response :success
  end

  test "should update shake" do
    patch :update, id: @shake, shake: { Calories: @shake.Calories, Cost: @shake.Cost, Description: @shake.Description, Name: @shake.Name }
    assert_redirected_to shake_path(assigns(:shake))
  end

  test "should destroy shake" do
    assert_difference('Shake.count', -1) do
      delete :destroy, id: @shake
    end

    assert_redirected_to shakes_path
  end
end
