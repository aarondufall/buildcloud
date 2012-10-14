class RenameTeamIdToAccountId < ActiveRecord::Migration
  def up
  	rename_column :contacts, :team_id, :account_id
  end

  def down
  	rename_column :contacts,:account_id , :team_id
  end
end
