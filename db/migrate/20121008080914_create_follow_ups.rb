class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.belongs_to :issue
      t.belongs_to :followed_up_by

      t.timestamps
    end
    add_index :follow_ups, :issue_id
    add_index :follow_ups, :followed_up_by_id
  end
end
