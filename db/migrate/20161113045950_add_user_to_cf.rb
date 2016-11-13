class AddUserToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :user_id, :integer
  end
end
