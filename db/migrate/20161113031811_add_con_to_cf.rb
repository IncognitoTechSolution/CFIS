class AddConToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :contributioncheck, :boolean
  end
end
