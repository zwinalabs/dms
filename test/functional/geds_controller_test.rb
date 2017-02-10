require 'test_helper'

class GedsControllerTest < ActionController::TestCase
  setup do
    @ged = geds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ged" do
    assert_difference('Ged.count') do
      post :create, ged: { url: @ged.url }
    end

    assert_redirected_to ged_path(assigns(:ged))
  end

  test "should show ged" do
    get :show, id: @ged
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ged
    assert_response :success
  end

  test "should update ged" do
    put :update, id: @ged, ged: { url: @ged.url }
    assert_redirected_to ged_path(assigns(:ged))
  end

  test "should destroy ged" do
    assert_difference('Ged.count', -1) do
      delete :destroy, id: @ged
    end

    assert_redirected_to geds_path
  end
end
