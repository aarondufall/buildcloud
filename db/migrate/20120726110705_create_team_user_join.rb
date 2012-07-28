class CreateTeamUserJoin < ActiveRecord::Migration
  def up
  	create_table 'teams_users', :id => false do |t|
  		t.column 'team_id', :integer
  		t.column 'user_id', :integer

  	end
  end

  def down
  	drop_table 'teams_users'
  end
end
