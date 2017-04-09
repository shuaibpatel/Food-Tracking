require 'test_helper'

class FoodspsControllerTest < ActionController::TestCase
  setup do
@customersp = customersps(:one)
@foodsp = @customersp.foodsps.first
  end

  test "should get index" do
    get :index, { :customersp_id => @customersp}
assert_response :success
assert_not_nil assigns(:foodsps)
end

  

  test "should get new" do
    get :new, { :customersp_id => @customersp}
assert_response :success
assert_not_nil assigns(:foodsp)
  end

  test "should create foodsp" do
    assert_difference('Foodsp.count') do
      post :create, foodsp: { caloriessp: @foodsp.caloriessp, customersp_id: @foodsp.customersp_id, expirysp: @foodsp.expirysp, fatsp: @foodsp.fatsp, pricesp: @foodsp.pricesp, productsp: @foodsp.productsp, proteinssp: @foodsp.proteinssp, sugarsp: @foodsp.sugarsp }
    end

    assert_redirected_to foodsp_path(assigns(:foodsp))
  end

  test "should show foodsp" do
    get :show, id: @foodsp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foodsp
    assert_response :success
  end

  test "should update foodsp" do
    patch :update, id: @foodsp, foodsp: { caloriessp: @foodsp.caloriessp, customersp_id: @foodsp.customersp_id, expirysp: @foodsp.expirysp, fatsp: @foodsp.fatsp, pricesp: @foodsp.pricesp, productsp: @foodsp.productsp, proteinssp: @foodsp.proteinssp, sugarsp: @foodsp.sugarsp }
    assert_redirected_to foodsp_path(assigns(:foodsp))
  end

  test "should destroy foodsp" do
    assert_difference('Foodsp.count', -1) do
      delete :destroy, id: @foodsp
    end

    assert_redirected_to foodsps_path
  end
end
