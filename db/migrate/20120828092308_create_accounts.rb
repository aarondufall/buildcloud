class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :account_owner_id
      t.string :plan
      t.integer :user_id
      t.timestamps
    end
  end
end
