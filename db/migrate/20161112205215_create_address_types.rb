class CreateAddressTypes < ActiveRecord::Migration
  def change
    create_table :address_types do |t|
      t.string :adtype

      t.timestamps null: false
    end
  end
end
