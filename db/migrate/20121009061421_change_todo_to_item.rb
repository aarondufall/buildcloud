class ChangeTodoToItem < ActiveRecord::Migration
  def up
  	rename_table :todos, :items
  end

  def down
  	rename_table :items, :todos 
  end
end
