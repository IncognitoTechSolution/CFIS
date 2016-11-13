class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :filer_id
      t.integer :prefix_id
      t.integer :office_held_id
      t.integer :office_sought_id
      t.string :firstname
      t.string :lastname
      t.string :mi
      t.string :alias
      t.string :suffix
      t.string :phone
      t.string :extension

      t.timestamps null: false
    end
  end
end
