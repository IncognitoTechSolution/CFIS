class CreateContributionTypes < ActiveRecord::Migration
  def change
    create_table :contribution_types do |t|
      t.string :contype

      t.timestamps null: false
    end
  end
end
