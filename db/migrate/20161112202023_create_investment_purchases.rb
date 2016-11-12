class CreateInvestmentPurchases < ActiveRecord::Migration
  def change
    create_table :investment_purchases do |t|
      t.integer :campaign_finance_info_id
      t.integer :prefix_id
      t.integer :entity_type_id
      t.string :investorname
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip
      t.float :amount
      t.date :date
      t.text :description

      t.timestamps null: false
    end
  end
end
