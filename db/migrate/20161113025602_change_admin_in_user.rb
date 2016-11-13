class ChangeAdminInUser < ActiveRecord::Migration
  def change
    rename_column :users, :isadmin, :admin
  end
end
