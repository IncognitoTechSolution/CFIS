require 'test_helper'

class CommitteeTypesControllerTest < ActionController::TestCase
  setup do
    @committee_type = committee_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:committee_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create committee_type" do
    assert_difference('CommitteeType.count') do
      post :create, committee_type: { comtype: @committee_type.comtype }
    end

    assert_redirected_to committee_type_path(assigns(:committee_type))
  end

  test "should show committee_type" do
    get :show, id: @committee_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @committee_type
    assert_response :success
  end

  test "should update committee_type" do
    patch :update, id: @committee_type, committee_type: { comtype: @committee_type.comtype }
    assert_redirected_to committee_type_path(assigns(:committee_type))
  end

  test "should destroy committee_type" do
    assert_difference('CommitteeType.count', -1) do
      delete :destroy, id: @committee_type
    end

    assert_redirected_to committee_types_path
  end
end
