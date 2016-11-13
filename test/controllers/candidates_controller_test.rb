require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: { alias: @candidate.alias, extension: @candidate.extension, filer_id: @candidate.filer_id, firstname: @candidate.firstname, lastname: @candidate.lastname, mi: @candidate.mi, office_held_id: @candidate.office_held_id, office_sought_id: @candidate.office_sought_id, phone: @candidate.phone, prefix_id: @candidate.prefix_id, suffix: @candidate.suffix }
    end

    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should show candidate" do
    get :show, id: @candidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate
    assert_response :success
  end

  test "should update candidate" do
    patch :update, id: @candidate, candidate: { alias: @candidate.alias, extension: @candidate.extension, filer_id: @candidate.filer_id, firstname: @candidate.firstname, lastname: @candidate.lastname, mi: @candidate.mi, office_held_id: @candidate.office_held_id, office_sought_id: @candidate.office_sought_id, phone: @candidate.phone, prefix_id: @candidate.prefix_id, suffix: @candidate.suffix }
    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete :destroy, id: @candidate
    end

    assert_redirected_to candidates_path
  end
end
