class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.integer :campaign_finance_info_id
      t.string :name
      t.integer :form_type_id
      t.date :travelbegin
      t.date :travelend
      t.integer :prefix_id
      t.string :travelername
      t.string :departureloc
      t.string :destinationloc
      t.string :transportation
      t.text :purpose

      t.timestamps null: false
    end
  end
end
