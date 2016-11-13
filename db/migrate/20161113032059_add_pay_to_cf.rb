class AddPayToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :paytocohcheck, :boolean
  end
end
