class TodoIdtoItemId < ActiveRecord::Migration
  def up
  	rename_column :issues, :todo_id, :item_id
  end

  def down
  	rename_column :issues, :item_id, :todo_id
  end
end
