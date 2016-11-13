class CreateFilerTypes < ActiveRecord::Migration
  def change
    create_table :filer_types do |t|
      t.string :ftype

      t.timestamps null: false
    end
  end
end
