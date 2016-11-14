class CreateCommitteeNotices < ActiveRecord::Migration
  def change
    create_table :committee_notices do |t|
      t.integer :campaign_finance_info_id
      t.integer :committee_type_id
      t.string :name
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip

      t.timestamps null: false
    end
  end
end
