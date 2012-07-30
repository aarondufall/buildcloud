class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :name
    	t.string :company
    	t.string :location
    	t.text	 :professional_bio
      	t.timestamps
    end

    add_index :profiles, :name
  end
end
