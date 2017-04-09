require 'test_helper'

class CustomerspsControllerTest < ActionController::TestCase
  setup do
    @customersp = customersps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customersps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customersp" do
    assert_difference('Customersp.count') do
      post :create, customersp: { emailsp: @customersp.emailsp, namesp: @customersp.namesp, phonesp: @customersp.phonesp, surnamesp: @customersp.surnamesp }
    end

    assert_redirected_to customersp_path(assigns(:customersp))
  end

  test "should show customersp" do
    get :show, id: @customersp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customersp
    assert_response :success
  end

  test "should update customersp" do
    patch :update, id: @customersp, customersp: { emailsp: @customersp.emailsp, namesp: @customersp.namesp, phonesp: @customersp.phonesp, surnamesp: @customersp.surnamesp }
    assert_redirected_to customersp_path(assigns(:customersp))
  end

  test "should destroy customersp" do
    assert_difference('Customersp.count', -1) do
      delete :destroy, id: @customersp
    end

    assert_redirected_to customersps_path
  end
end
