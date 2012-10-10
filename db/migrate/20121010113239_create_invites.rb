class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :target, polymorphic: true
      t.belongs_to :account
      t.string :email
      t.string :token
      t.timestamps
    end
    add_index :invites, :target_id
  end
end
