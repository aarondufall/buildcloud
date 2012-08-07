class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name,				:null => false, :default => ""
      t.string :job_number,			:null => false, :default => ""
      t.integer :created_by

      t.timestamps
    end
  end
end
