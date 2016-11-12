class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :campaign_finance_info_id
      t.integer :prefix_id
      t.integer :entity_type_id
      t.string :creditorname
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip
      t.float :amount
      t.date :date
      t.text :purpose
      t.boolean :isreturnedtofiler

      t.timestamps null: false
    end
  end
end
