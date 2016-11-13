class MyreportController < ApplicationController

  def index
    @campaign_finance_infos = CampaignFinanceInfo.where(:user_id => current_user.id)
  end

end
