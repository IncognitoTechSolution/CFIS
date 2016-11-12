require 'test_helper'

class InvestmentPurchasesControllerTest < ActionController::TestCase
  setup do
    @investment_purchase = investment_purchases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investment_purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investment_purchase" do
    assert_difference('InvestmentPurchase.count') do
      post :create, investment_purchase: { address: @investment_purchase.address, amount: @investment_purchase.amount, campaign_finance_info_id: @investment_purchase.campaign_finance_info_id, city: @investment_purchase.city, date: @investment_purchase.date, description: @investment_purchase.description, entity_type_id: @investment_purchase.entity_type_id, investorname: @investment_purchase.investorname, prefix_id: @investment_purchase.prefix_id, state_id: @investment_purchase.state_id, zip: @investment_purchase.zip }
    end

    assert_redirected_to investment_purchase_path(assigns(:investment_purchase))
  end

  test "should show investment_purchase" do
    get :show, id: @investment_purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investment_purchase
    assert_response :success
  end

  test "should update investment_purchase" do
    patch :update, id: @investment_purchase, investment_purchase: { address: @investment_purchase.address, amount: @investment_purchase.amount, campaign_finance_info_id: @investment_purchase.campaign_finance_info_id, city: @investment_purchase.city, date: @investment_purchase.date, description: @investment_purchase.description, entity_type_id: @investment_purchase.entity_type_id, investorname: @investment_purchase.investorname, prefix_id: @investment_purchase.prefix_id, state_id: @investment_purchase.state_id, zip: @investment_purchase.zip }
    assert_redirected_to investment_purchase_path(assigns(:investment_purchase))
  end

  test "should destroy investment_purchase" do
    assert_difference('InvestmentPurchase.count', -1) do
      delete :destroy, id: @investment_purchase
    end

    assert_redirected_to investment_purchases_path
  end
end
