class CreateTreasurers < ActiveRecord::Migration
  def change
    create_table :treasurers do |t|
      t.integer :prefix_id
      t.string :firstname
      t.string :mi
      t.string :lastname
      t.string :alias
      t.string :suffix
      t.string :phone
      t.string :extension

      t.timestamps null: false
    end
  end
end
