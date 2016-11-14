require 'test_helper'

class FormTypesControllerTest < ActionController::TestCase
  setup do
    @form_type = form_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_type" do
    assert_difference('FormType.count') do
      post :create, form_type: { formtype: @form_type.formtype }
    end

    assert_redirected_to form_type_path(assigns(:form_type))
  end

  test "should show form_type" do
    get :show, id: @form_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_type
    assert_response :success
  end

  test "should update form_type" do
    patch :update, id: @form_type, form_type: { formtype: @form_type.formtype }
    assert_redirected_to form_type_path(assigns(:form_type))
  end

  test "should destroy form_type" do
    assert_difference('FormType.count', -1) do
      delete :destroy, id: @form_type
    end

    assert_redirected_to form_types_path
  end
end
