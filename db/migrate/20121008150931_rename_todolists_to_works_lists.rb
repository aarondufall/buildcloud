class RenameTodolistsToWorksLists < ActiveRecord::Migration
  def up
  	rename_table :todolists, :worklists
  end

  def down
  	rename_table :worklists, :todolists
  end
end
