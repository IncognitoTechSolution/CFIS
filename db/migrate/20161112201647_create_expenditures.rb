class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.integer :campaign_finance_info_id
      t.integer :expend_type_id
      t.integer :expend_category_id
      t.integer :payment_method_id
      t.integer :prefix_id
      t.integer :entity_type_id
      t.string :contributorname
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip
      t.float :amount
      t.date :date
      t.text :description
      t.boolean :isbenefitCOH
      t.boolean :istraveloutsidetx
      t.boolean :isreimbursementintended

      t.timestamps null: false
    end
  end
end
