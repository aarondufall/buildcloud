class RenameTodoColumns < ActiveRecord::Migration
  def up
  	rename_column :todos, :assigned_to, :assigned_to_id
  	rename_column :todos, :created_by, :created_by_id
  end

  def down
  	rename_column :todos, :assigned_to_id, :assigned_to
  	rename_column :todos, :created_by_id, :created_by
  end
end
