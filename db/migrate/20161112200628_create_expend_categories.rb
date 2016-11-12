class CreateExpendCategories < ActiveRecord::Migration
  def change
    create_table :expend_categories do |t|
      t.string :expendcat

      t.timestamps null: false
    end
  end
end
