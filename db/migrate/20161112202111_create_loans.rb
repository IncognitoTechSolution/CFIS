class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :campaign_finance_info_id
      t.integer :prefix_id
      t.integer :entity_type_id
      t.string :lendername
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip
      t.boolean :isfinancialinstitution
      t.boolean :isoutofstatpac
      t.string :pacid
      t.float :amount
      t.float :interestrate
      t.date :date
      t.date :maturitydate
      t.text :collateraldescription
      t.boolean :ispersonalfunddeposit

      t.timestamps null: false
    end
  end
end
