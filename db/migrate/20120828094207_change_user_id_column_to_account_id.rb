class ChangeUserIdColumnToAccountId < ActiveRecord::Migration
  def up
  	rename_column :teams, :user_id, :account_id
  end

  def down
  	rename_column :teams, :account_id, :user_id
  end
end
