class RemoveOwnerFromTeam < ActiveRecord::Migration
  def up
  	remove_column :teams, :owner
  end

  def down
  	add_colum :teams, :owner, :string
  end
end
