class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :target, polymorphic: true, null: false
      t.belongs_to :user
      t.belongs_to :team
      t.timestamps
    end
    add_index :memberships, [:target_id, :target_type]
    add_index :memberships, [:target_id, :target_type, :team_id]
    add_index :memberships, [:target_id, :target_type, :user_id]
  end
end
