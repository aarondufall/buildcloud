class RenameTodolistIdToWorklistId < ActiveRecord::Migration
  def up
  	rename_column :todos, :todolist_id, :worklist_id
  end

  def down
  	rename_column :todos,  :worklist_id, :todolist_id
  end
end
