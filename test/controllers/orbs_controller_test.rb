require 'test_helper'

class OrbsControllerTest < ActionController::TestCase
  setup do
    @orb = orbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orb" do
    assert_difference('Orb.count') do
      post :create, orb: { category: @orb.category, description: @orb.description, image: @orb.image, name: @orb.name }
    end

    assert_redirected_to orb_path(assigns(:orb))
  end

  test "should show orb" do
    get :show, id: @orb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orb
    assert_response :success
  end

  test "should update orb" do
    patch :update, id: @orb, orb: { category: @orb.category, description: @orb.description, image: @orb.image, name: @orb.name }
    assert_redirected_to orb_path(assigns(:orb))
  end

  test "should destroy orb" do
    assert_difference('Orb.count', -1) do
      delete :destroy, id: @orb
    end

    assert_redirected_to orbs_path
  end
end
