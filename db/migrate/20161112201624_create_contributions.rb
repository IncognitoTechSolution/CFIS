class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :campaign_finance_info_id
      t.integer :contribution_type_id
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
      t.boolean :isoutofstatepac
      t.string :pacid
      t.boolean :istraveloutsidetx

      t.timestamps null: false
    end
  end
end
