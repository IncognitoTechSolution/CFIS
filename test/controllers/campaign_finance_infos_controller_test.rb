require 'test_helper'

class CampaignFinanceInfosControllerTest < ActionController::TestCase
  setup do
    @campaign_finance_info = campaign_finance_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaign_finance_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campaign_finance_info" do
    assert_difference('CampaignFinanceInfo.count') do
      post :create, campaign_finance_info: { campaignyear: @campaign_finance_info.campaignyear, candidate_id: @campaign_finance_info.candidate_id, election_type_id: @campaign_finance_info.election_type_id, electiondate: @campaign_finance_info.electiondate, filename: @campaign_finance_info.filename, filer_id: @campaign_finance_info.filer_id, ontime: @campaign_finance_info.ontime, periodbegin: @campaign_finance_info.periodbegin, periodend: @campaign_finance_info.periodend, report_type_id: @campaign_finance_info.report_type_id, sudmitdate: @campaign_finance_info.sudmitdate, treasurer_id: @campaign_finance_info.treasurer_id }
    end

    assert_redirected_to campaign_finance_info_path(assigns(:campaign_finance_info))
  end

  test "should show campaign_finance_info" do
    get :show, id: @campaign_finance_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campaign_finance_info
    assert_response :success
  end

  test "should update campaign_finance_info" do
    patch :update, id: @campaign_finance_info, campaign_finance_info: { campaignyear: @campaign_finance_info.campaignyear, candidate_id: @campaign_finance_info.candidate_id, election_type_id: @campaign_finance_info.election_type_id, electiondate: @campaign_finance_info.electiondate, filename: @campaign_finance_info.filename, filer_id: @campaign_finance_info.filer_id, ontime: @campaign_finance_info.ontime, periodbegin: @campaign_finance_info.periodbegin, periodend: @campaign_finance_info.periodend, report_type_id: @campaign_finance_info.report_type_id, sudmitdate: @campaign_finance_info.sudmitdate, treasurer_id: @campaign_finance_info.treasurer_id }
    assert_redirected_to campaign_finance_info_path(assigns(:campaign_finance_info))
  end

  test "should destroy campaign_finance_info" do
    assert_difference('CampaignFinanceInfo.count', -1) do
      delete :destroy, id: @campaign_finance_info
    end

    assert_redirected_to campaign_finance_infos_path
  end
end
