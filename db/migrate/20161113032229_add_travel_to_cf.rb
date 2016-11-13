class AddTravelToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :travelcheck, :boolean
  end
end
