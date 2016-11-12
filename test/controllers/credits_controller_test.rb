require 'test_helper'

class CreditsControllerTest < ActionController::TestCase
  setup do
    @credit = credits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit" do
    assert_difference('Credit.count') do
      post :create, credit: { address: @credit.address, amount: @credit.amount, campaign_finance_info_id: @credit.campaign_finance_info_id, city: @credit.city, creditorname: @credit.creditorname, date: @credit.date, entity_type_id: @credit.entity_type_id, isreturnedtofiler: @credit.isreturnedtofiler, prefix_id: @credit.prefix_id, purpose: @credit.purpose, state_id: @credit.state_id, zip: @credit.zip }
    end

    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should show credit" do
    get :show, id: @credit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit
    assert_response :success
  end

  test "should update credit" do
    patch :update, id: @credit, credit: { address: @credit.address, amount: @credit.amount, campaign_finance_info_id: @credit.campaign_finance_info_id, city: @credit.city, creditorname: @credit.creditorname, date: @credit.date, entity_type_id: @credit.entity_type_id, isreturnedtofiler: @credit.isreturnedtofiler, prefix_id: @credit.prefix_id, purpose: @credit.purpose, state_id: @credit.state_id, zip: @credit.zip }
    assert_redirected_to credit_path(assigns(:credit))
  end

  test "should destroy credit" do
    assert_difference('Credit.count', -1) do
      delete :destroy, id: @credit
    end

    assert_redirected_to credits_path
  end
end
