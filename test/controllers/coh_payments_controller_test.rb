require 'test_helper'

class CohPaymentsControllerTest < ActionController::TestCase
  setup do
    @coh_payment = coh_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coh_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coh_payment" do
    assert_difference('CohPayment.count') do
      post :create, coh_payment: { address: @coh_payment.address, amount: @coh_payment.amount, businessname: @coh_payment.businessname, campaign_finance_info_id: @coh_payment.campaign_finance_info_id, city: @coh_payment.city, date: @coh_payment.date, description: @coh_payment.description, entity_type_id: @coh_payment.entity_type_id, expend_category_id: @coh_payment.expend_category_id, isaustintxlivingexpense: @coh_payment.isaustintxlivingexpense, isbenefitcoh: @coh_payment.isbenefitcoh, istraveloutsidetx: @coh_payment.istraveloutsidetx, prefix_id: @coh_payment.prefix_id, state_id: @coh_payment.state_id, zip: @coh_payment.zip }
    end

    assert_redirected_to coh_payment_path(assigns(:coh_payment))
  end

  test "should show coh_payment" do
    get :show, id: @coh_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coh_payment
    assert_response :success
  end

  test "should update coh_payment" do
    patch :update, id: @coh_payment, coh_payment: { address: @coh_payment.address, amount: @coh_payment.amount, businessname: @coh_payment.businessname, campaign_finance_info_id: @coh_payment.campaign_finance_info_id, city: @coh_payment.city, date: @coh_payment.date, description: @coh_payment.description, entity_type_id: @coh_payment.entity_type_id, expend_category_id: @coh_payment.expend_category_id, isaustintxlivingexpense: @coh_payment.isaustintxlivingexpense, isbenefitcoh: @coh_payment.isbenefitcoh, istraveloutsidetx: @coh_payment.istraveloutsidetx, prefix_id: @coh_payment.prefix_id, state_id: @coh_payment.state_id, zip: @coh_payment.zip }
    assert_redirected_to coh_payment_path(assigns(:coh_payment))
  end

  test "should destroy coh_payment" do
    assert_difference('CohPayment.count', -1) do
      delete :destroy, id: @coh_payment
    end

    assert_redirected_to coh_payments_path
  end
end
