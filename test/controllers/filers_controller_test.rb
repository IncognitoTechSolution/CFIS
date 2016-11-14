require 'test_helper'

class FilersControllerTest < ActionController::TestCase
  setup do
    @filer = filers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filer" do
    assert_difference('Filer.count') do
      post :create, filer: { committeename: @filer.committeename, emailpasswordto: @filer.emailpasswordto, extension: @filer.extension, filer_type_id: @filer.filer_type_id, firstname: @filer.firstname, lastname: @filer.lastname, mi: @filer.mi, office_held_id: @filer.office_held_id, office_sought_id: @filer.office_sought_id, phone: @filer.phone, releasepassword: @filer.releasepassword, releasepasswordto: @filer.releasepasswordto, signature: @filer.signature }
    end

    assert_redirected_to filer_path(assigns(:filer))
  end

  test "should show filer" do
    get :show, id: @filer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filer
    assert_response :success
  end

  test "should update filer" do
    patch :update, id: @filer, filer: { committeename: @filer.committeename, emailpasswordto: @filer.emailpasswordto, extension: @filer.extension, filer_type_id: @filer.filer_type_id, firstname: @filer.firstname, lastname: @filer.lastname, mi: @filer.mi, office_held_id: @filer.office_held_id, office_sought_id: @filer.office_sought_id, phone: @filer.phone, releasepassword: @filer.releasepassword, releasepasswordto: @filer.releasepasswordto, signature: @filer.signature }
    assert_redirected_to filer_path(assigns(:filer))
  end

  test "should destroy filer" do
    assert_difference('Filer.count', -1) do
      delete :destroy, id: @filer
    end

    assert_redirected_to filers_path
  end
end
