class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.string :type
      t.integer :assigned_to_id
      t.datetime :closed_at
      t.integer :todo_id

      t.timestamps
    end
  end
end
