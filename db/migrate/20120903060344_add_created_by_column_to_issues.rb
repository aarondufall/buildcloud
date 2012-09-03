class AddCreatedByColumnToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :created_by, :integer
  end
end
