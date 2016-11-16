class AddInvestMentCheck < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :investmentcheck, :boolean
  end
end
