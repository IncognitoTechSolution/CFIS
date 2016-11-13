class AddCreditToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :creditcheck, :boolean
  end
end
