class AddNoticeToCf < ActiveRecord::Migration
  def change
    add_column :campaign_finance_infos, :noticecheck, :boolean
  end
end
