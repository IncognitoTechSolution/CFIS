class CreateElectionTypes < ActiveRecord::Migration
  def change
    create_table :election_types do |t|
      t.string :ectype

      t.timestamps null: false
    end
  end
end
