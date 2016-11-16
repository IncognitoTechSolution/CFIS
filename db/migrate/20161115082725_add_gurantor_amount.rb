class AddGurantorAmount < ActiveRecord::Migration
  def change
    add_column :loans, :amountguaranteed, :float
  end
end
