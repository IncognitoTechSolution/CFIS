class CreateCohPayments < ActiveRecord::Migration
  def change
    create_table :coh_payments do |t|
      t.integer :campaign_finance_info_id
      t.integer :expend_category_id
      t.integer :prefix_id
      t.integer :entity_type_id
      t.string :businessname
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip
      t.float :amount
      t.date :date
      t.text :description
      t.boolean :isbenefitcoh
      t.boolean :istraveloutsidetx
      t.boolean :isaustintxlivingexpense

      t.timestamps null: false
    end
  end
end
