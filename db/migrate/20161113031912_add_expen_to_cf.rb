class AddExpenToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :expenditurecheck, :boolean
  end
end
