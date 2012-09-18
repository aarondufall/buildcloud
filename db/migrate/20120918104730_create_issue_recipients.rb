class CreateIssueRecipients < ActiveRecord::Migration
  def change
    create_table :issue_recipients do |t|
      t.belongs_to :issue
      t.belongs_to :user
      t.belongs_to :contact

      t.timestamps
    end
    add_index :issue_recipients, :issue_id
    add_index :issue_recipients, :user_id
    add_index :issue_recipients, :contact_id
  end
end
