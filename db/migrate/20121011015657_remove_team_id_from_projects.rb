class RemoveTeamIdFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :team_id
  end

  def down
    add_column :projects, :team_id, :integer
  end
end
