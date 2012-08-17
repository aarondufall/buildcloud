class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.boolean :focused
      t.integer :created_by
      t.integer :assigned_to
      t.integer :todolist_id
      t.datetime :scheduled
      t.datetime :completed_at

      t.timestamps
    end
  end
end
