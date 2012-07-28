class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :dept_no

      	t.timestamps
    end
  end
end
