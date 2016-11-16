class AddGuarantorToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :guarantor, :string
  end
end
