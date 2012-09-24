class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.text :comment
      t.belongs_to :issue

      t.timestamps
    end
    add_index :follow_ups, :issue_id
  end
end
