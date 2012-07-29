class IndexTeamUserJoinTable < ActiveRecord::Migration
  def up
  	add_index :teams_users, [ :team_id, :user_id ], :unique => true, :name => 'by_team_and_user'
  	
  end

  def down
  end
end
