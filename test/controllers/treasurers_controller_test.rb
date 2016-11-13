require 'test_helper'

class TreasurersControllerTest < ActionController::TestCase
  setup do
    @treasurer = treasurers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treasurers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treasurer" do
    assert_difference('Treasurer.count') do
      post :create, treasurer: { alias: @treasurer.alias, extension: @treasurer.extension, firstname: @treasurer.firstname, lastname: @treasurer.lastname, mi: @treasurer.mi, phone: @treasurer.phone, prefix_id: @treasurer.prefix_id, suffix: @treasurer.suffix }
    end

    assert_redirected_to treasurer_path(assigns(:treasurer))
  end

  test "should show treasurer" do
    get :show, id: @treasurer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treasurer
    assert_response :success
  end

  test "should update treasurer" do
    patch :update, id: @treasurer, treasurer: { alias: @treasurer.alias, extension: @treasurer.extension, firstname: @treasurer.firstname, lastname: @treasurer.lastname, mi: @treasurer.mi, phone: @treasurer.phone, prefix_id: @treasurer.prefix_id, suffix: @treasurer.suffix }
    assert_redirected_to treasurer_path(assigns(:treasurer))
  end

  test "should destroy treasurer" do
    assert_difference('Treasurer.count', -1) do
      delete :destroy, id: @treasurer
    end

    assert_redirected_to treasurers_path
  end
end
