require 'test_helper'

class ContributionTypesControllerTest < ActionController::TestCase
  setup do
    @contribution_type = contribution_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contribution_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contribution_type" do
    assert_difference('ContributionType.count') do
      post :create, contribution_type: { contype: @contribution_type.contype }
    end

    assert_redirected_to contribution_type_path(assigns(:contribution_type))
  end

  test "should show contribution_type" do
    get :show, id: @contribution_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contribution_type
    assert_response :success
  end

  test "should update contribution_type" do
    patch :update, id: @contribution_type, contribution_type: { contype: @contribution_type.contype }
    assert_redirected_to contribution_type_path(assigns(:contribution_type))
  end

  test "should destroy contribution_type" do
    assert_difference('ContributionType.count', -1) do
      delete :destroy, id: @contribution_type
    end

    assert_redirected_to contribution_types_path
  end
end
