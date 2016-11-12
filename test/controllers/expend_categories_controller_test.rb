require 'test_helper'

class ExpendCategoriesControllerTest < ActionController::TestCase
  setup do
    @expend_category = expend_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expend_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expend_category" do
    assert_difference('ExpendCategory.count') do
      post :create, expend_category: { expenctype: @expend_category.expenctype }
    end

    assert_redirected_to expend_category_path(assigns(:expend_category))
  end

  test "should show expend_category" do
    get :show, id: @expend_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expend_category
    assert_response :success
  end

  test "should update expend_category" do
    patch :update, id: @expend_category, expend_category: { expenctype: @expend_category.expenctype }
    assert_redirected_to expend_category_path(assigns(:expend_category))
  end

  test "should destroy expend_category" do
    assert_difference('ExpendCategory.count', -1) do
      delete :destroy, id: @expend_category
    end

    assert_redirected_to expend_categories_path
  end
end
