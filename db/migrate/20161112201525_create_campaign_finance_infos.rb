class CreateCampaignFinanceInfos < ActiveRecord::Migration
  def change
    create_table :campaign_finance_infos do |t|
      t.integer :filer_id
      t.integer :report_type_id
      t.integer :candidate_id
      t.integer :treasurer_id
      t.integer :election_type_id
      t.date :sudmitdate
      t.string :filename
      t.string :campaignyear
      t.boolean :ontime
      t.date :periodbegin
      t.date :periodend
      t.date :electiondate

      t.timestamps null: false
    end
  end
end
