class AddOwnerToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :owner, :string
  end
end
