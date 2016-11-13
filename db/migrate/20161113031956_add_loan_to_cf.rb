class AddLoanToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :loancheck, :boolean
  end
end
