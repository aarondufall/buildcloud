class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :name,				:null => false, :default => ""
      t.date :start_date
      t.date :end_date
      t.integer :project_id

      t.timestamps
    end
  end
end
