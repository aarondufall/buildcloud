class AddAccountIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :account_id, :interger
  end
end
