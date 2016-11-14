class CreateFormTypes < ActiveRecord::Migration
  def change
    create_table :form_types do |t|
      t.string :formtype

      t.timestamps null: false
    end
  end
end
