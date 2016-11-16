class ChangeAdressType < ActiveRecord::Migration
  def change
    rename_column :addresses, :address_type, :address_type_id
  end
end
