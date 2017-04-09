require 'test_helper'

class NeedsControllerTest < ActionController::TestCase
  setup do
    @need = needs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:needs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create need" do
    assert_difference('Need.count') do
      post :create, need: { color: @need.color, cost: @need.cost, description: @need.description, firstname: @need.firstname, lastname: @need.lastname, manufacturer: @need.manufacturer }
    end

    assert_redirected_to need_path(assigns(:need))
  end

  test "should show need" do
    get :show, id: @need
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @need
    assert_response :success
  end

  test "should update need" do
    patch :update, id: @need, need: { color: @need.color, cost: @need.cost, description: @need.description, firstname: @need.firstname, lastname: @need.lastname, manufacturer: @need.manufacturer }
    assert_redirected_to need_path(assigns(:need))
  end

  test "should destroy need" do
    assert_difference('Need.count', -1) do
      delete :destroy, id: @need
    end

    assert_redirected_to needs_path
  end
end
